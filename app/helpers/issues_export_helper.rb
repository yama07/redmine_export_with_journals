module IssuesExportHelper
  def add_journals_and_changesets(csv)
    csv_with_journals = FCSV.generate do |newcsv|
      FCSV.parse(Redmine::CodesetUtil.to_utf8(csv, 'CP932'), :headers => true, :return_headers => true) do |row|
        if row.header_row?
          newcsv << row.fields + [t(:label_history)] + [t(:label_associated_revisions)]
        else
          issue_id = row.fields.first
          journals = _journals issue_id
          changesets = _changesets issue_id
          (1..[journals.length, changesets.length].max).zip(journals, changesets).each do |index, j, c|
            newcsv << (index == 1 ? row.fields : ([""] * row.fields.length)) + [j.nil? ? "" : j] + [c.nil? ? "" : c]
          end.empty? and begin
            newcsv << row.fields
          end
        end
      end
    end
    Redmine::CodesetUtil.from_utf8(csv_with_journals, 'CP932')
  end

  def _journals(issue_id)
    Issue.find(issue_id).journals.map do |j|
      value = j.user.name + "\n"
      value << j.details.map {|d| show_detail(d, true)}.join("\n") + "\n"
      value << (j.notes.nil? ? '' : j.notes)
    end
  end

  def _changesets(issue_id)
    Issue.find(issue_id).changesets.map do |c|
      value = c.author + "\n"
      value << format_time(c.committed_on) + "\n"
      value << c.format_identifier + "\n"
      value << c.comments
    end
  end
end
