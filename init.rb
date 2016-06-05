require 'redmine'
require 'export_with_journals'

Redmine::Plugin.register :redmine_export_with_journals do
  name 'Redmine Export With Journals plugin'
  author 'yama07'
  description 'Export CSV with Journals and Changesets'
  version '0.0.7'
  url 'https://github.com/yama07/redmine_export_with_journals.git'
  permission :export_csv_with_journals, {:issues_export => :export_with_journals}
end
