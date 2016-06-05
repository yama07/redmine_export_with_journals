Redmine Export with Journals and Changesets Plugin (Vertical Layout)
========================================
A redmine plugin to export issues CSV with history(journals and changesets).
This is a fork of [this repository](https://github.com/yama07/redmine_export_with_journals_and_changesets.git)

The upstream includes only journals, but this fork also includes the changesets.

Example
--------------------

### upstream

```
1,aaaa,bbb,ccc,ddd,journal1
"","","","","",journal2
"","","","","",journal3
2,AAAA,BBB,CCC,DDD
```

### this fork

```
1,aaaa,bbb,ccc,ddd,journal1,changesets1
"","","","","",journal2,changesets2
"","","","","",journal3,changesets3
2,AAAA,BBB,CCC,DDD
```


Requirements
---------------------
* Redmine 2.3.x

Installation
---------------------

1. $ cd REDMINE_ROOT/plugins
2. $ git clone https://github.com/yama07/redmine_export_with_journals.git
3. $ cd redmine_export_with_journals
4. $ git checkout with_changesets
5. restart redmine
