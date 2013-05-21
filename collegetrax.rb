#!/usr/bin/env ruby

require_relative 'bootstrap_ar'
database = ENV['FP_ENV'] || 'development'
connect_to database

command = ARGV[0]
name = ARGV[1]
date = ARGV[2]
rank = ARGV[3]

params = { command: command, visit: { school_name: name, visit_date: date, ranking: rank }}
controller = CollegeTraxController.new(params)


if command == "add"
  controller.create_visit
elsif command == "list_schools"
  controller.index
elsif command == "remove"
  controller.destroy
else
  unless command == "help"
    puts "CollegeTrax does not (yet?) support the '#{command}' command.\n\n"
  end
  puts <<EOS
Currently supported commands are:
* ctrax add <school_name>
* ctrax list_schools
* ctrax remove <school_name>

See the README for more details
EOS
end