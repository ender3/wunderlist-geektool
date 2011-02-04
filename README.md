# Project Descriptpton  
Looks up the projects and tasks in your wunderlist.db, and exports them in a ANSI marked up manner appropriate for display in geektool3

**Requires** sqllite3 gem.

`sudo install gem sqlite3`

If you have trouble with the install, there's about 100 web pages on how to troubleshoot it.

## Details  
If a task is marked as IMPORTANT in wunderlist, it will be prefaced with a star and styled with the `ESCAPE_IMPORTANT_COLOR`  
If a task has a date in wunderlist, it will be displayed. If the date is in the past, it will be styled with the `ESCAPE_PAST_DUE_COLOR`  
Project names are styled with `ESCAPE_PROJECT_NAME_MARKUP`  
Notes will be displayed, if present, and are styled with `ESCAPE_NOTE_MARKUP`

## How to Use in geektool
Just make a new geeklet, and type the path and name of the `command`

The styles will work best (in particular the star) if you use a font that has the full unicode char set for your geektool display. 