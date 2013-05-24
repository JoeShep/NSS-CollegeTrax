# require '../bootstrap_ar'

module TextPrompts

  def self.add_school
    print "Enter the name of a school you have visited:\n"
      name = $stdin.gets.chomp
    print "Enter the date of your visit. Include the month, date and year:\n"
      date = $stdin.gets.chomp
    Visit.create(params[:visit])
  end

end