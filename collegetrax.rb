#!/usr/bin/env ruby

require_relative 'bootstrap_ar'
database = ENV['FP_ENV'] || 'development'
connect_to database

command = nil
name = nil
command = ARGV[0].downcase unless ARGV[0].nil?
name    = ARGV[1]
date    = ARGV[2]


params = { command: command, visit: { school_name: name, visit_date: date}}
controller = CollegeTraxController.new(params)
routes = {"add" => :create_visit, "list" => :index, "remove" => :destroy,
           "rankings" => :index_rankings, "view" => :display_school}

if command.nil?
  Menu.print_menu
elsif route = routes[command]
  controller.send route
else
  # unless command == "help"
    puts "CollegeTrax does not (yet?) support the '#{command}' command.\n\n"
  # end
  puts <<EOS
Currently supported commands are:
* trax add <school_name>
* trax list
* trax rankings
* trax remove <school_name>

See the README for more details
EOS
end