
class CollegeTraxController

  def initialize params
    @params = params
  end

  def create_visit
    if params[:visit][:school_name].nil?
      print "Enter the name of a school you have visited:\n"
        name = $stdin.gets.chomp
      print "Enter the date of your visit. Include the month, date and year:\n"
        date = $stdin.gets.chomp
      visit = Visit.create(school_name: name, visit_date: date)
    else
      visit = Visit.create(params[:visit])
    end
    if visit.save
      puts "Your visit to #{Visit.last.school_name} on #{Visit.last.formatted_date} has been saved to your tracker!"
      add_data
    else
      puts "Failure :( #{visit.errors.full_messages.join(", ")}"
    end
  end

  def add_data
  puts "Do you want to add contact info for someone you met during your visit? \x1b[35my or n\x1b[0m"
  if $stdin.gets.chomp == "y"
    puts "Enter contact name:"
      name = $stdin.gets.chomp
    puts "Enter contact_email:"
      email = $stdin.gets.chomp
    puts "Enter contact_phone:"
      phone = $stdin.gets.chomp
  end
    puts "No problem. We'll skip that part." + "\n\n" + "Enter \x1b[35my\x1b[0m or \x1b[35mn\x1b[0m for the following questions:" + "\n"
    puts "Was school in session?"
      session = $stdin.gets.chomp
    puts "Did you take a guided tour?"
      tour = $stdin.gets.chomp
    puts "Did you do an admissions interview?"
      interview = $stdin.gets.chomp
    puts "Did you attend an info session?"
      info = $stdin.gets.chomp
    puts "Did you stay overnight on campus?"
      info = $stdin.gets.chomp
    puts "Did you attend any classes?"
      classes = $stdin.gets.chomp
  Visit.last.update_attributes(contact_name: name, contat_email: email, contact_phone: phone)
    puts "Your tracker has been updated! Ready to enter your rankings for #{Visit.last.school_name}?"
  end

  def index
    visits = Visit.all
    visits.each_with_index do |visit, i|
      puts "#{i+1}. #{visit.school_name}, visited on #{visit.formatted_date}." # My overall rank: #{visit.ranking} out of 5
    end
  end

  def index_rankings
    visits = Visit.order("ranking DESC")
    visits.each_with_index do |visit, i|
      puts "#{i+1}. #{visit.school_name} Average rank: #{visit.ranking}"
    end
  end

  def destroy
    matching_visits = Visit.where(school_name: params[:visit][:school_name]).all
    matching_visits.each do |visit|
      visit.destroy
    end
  end


  private

  def params
    @params
  end
end