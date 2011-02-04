require 'sqlite3'

db = SQLite3::Database.new( "/Users/mcave/Library/Application Support/Titanium/appdata/com.wunderkinder.wunderlist/wunderlist.db" )
db.results_as_hash = true # results returned as a hash, rather than an ordered array
db.type_translation = true # results resurned as their native types (according to the column definition) rather than String
 
db.execute("select id, name, position from lists where deleted = '0' order by position") do |list|
    printedHeader = false
    db.execute("select id, date, name, note, important, position from tasks where deleted = 0 and done = 0 and list_id = ? order by date DESC, position", list['id']) do |task|
    
        # There is a task associated with this list, so print the header
        if (printedHeader == false) then
            puts
            puts "\033[1m" + list['name'] + "\033[0m"  # this prints a header
            printedHeader = true
        end
        
        taskToOutput = ""
        
        # if there is a date, print it before the name of the task
        if (task['date'] != 0 ) then
            date = Time.at(task['date'])
            today = Time.new
            
            #if the date is in the past, print the date in red
            if (today > date) then 
                taskToOutput += "     " + "\033[31m" + date.month.to_s + "/" + date.day.to_s + "/" + date.year.to_s + "\033[0m" + " - "
            else
                taskToOutput += "     " + date.month.to_s + "/" + date.day.to_s + "/" + date.year.to_s + " - "
            end
        else
            taskToOutput += "     " 
        end
        
        if (task['important'] == 1) then
          taskToOutput += "\033[33m" + "★ " + "\033[0m"
        end
        taskToOutput += task['name']
        
        puts taskToOutput
        
        # if there is a note, print it in italics
        if (!task['note'].nil?) then
          puts "          " + "\033[3m" + task['note'] + "\033[0m" 
        end # end if (is there a task note)
    end # end do |task| loop
end