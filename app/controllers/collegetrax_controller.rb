
class CollegeTraxController
  include TextPrompts

  def initialize params
    @params = params
  end

  def create_visit
    if params[:visit][:school_name].nil?
      puts "   Enter the name of a school you have visited:"
        name = $stdin.gets.chomp
      puts "   Enter the date of your visit. Include the month, date and year:"
        date = $stdin.gets.chomp
      visit = Visit.create(school_name: name, visit_date: date)
    else
      visit = Visit.create(params[:visit])
    end
    if visit.save
      puts "\n" + "    Your visit to #{Visit.last.school_name} on #{Visit.last.formatted_date} has been saved to your tracker!"
    else
      puts "\n" + "    Failure :( #{visit.errors.full_messages.join(", ")}"
    end
    get_visit_data
  end

  def get_visit_data
    visit_data = {}
  puts contact_prompt
  if $stdin.gets.chomp == "n"
    puts yes_no_prompt1
  else
    puts "Enter contact name:"
      visit_data["name"] = $stdin.gets.chomp
    puts "Enter contact_email:"
      visit_data["email"] = $stdin.gets.chomp
    puts "Enter contact_phone:"
      visit_data["phone"] = $stdin.gets.chomp
    puts yes_no_prompt2
  end
    puts "Was school in session?"
      visit_data["session"] = $stdin.gets.chomp
    puts "Did you take a guided tour?"
      visit_data["tour"] = $stdin.gets.chomp
    puts "Did you do an admissions interview?"
      visit_data["interview"] = $stdin.gets.chomp
    puts "Did you attend an info session?"
      visit_data["info"] = $stdin.gets.chomp
    puts "Did you stay overnight on campus?"
      visit_data["overnight"] = $stdin.gets.chomp
    puts "Did you attend any classes?"
      visit_data["classes"] = $stdin.gets.chomp
    add_visit_data(visit_data)
  end

  def add_visit_data(visit_data)
  Visit.last.update_attributes(
    contact_name: visit_data["name"],
    contat_email: visit_data["email"],
    contact_phone: visit_data["phone"],
    in_session: visit_data["session"],
    tour: visit_data["tour"],
    interview: visit_data["interview"],
    info_session: visit_data["info"],
    overnight: visit_data["overnight"],
    class_visit: visit_data["classes"]
    )
    puts "\n" + "    Your tracker has been updated! Ready to enter your rankings for #{Visit.last.school_name}?" + "\n"
    $stdin.gets.chomp == "y" ? get_rankings : skip_rankings
  end

  def get_rankings
    rankings = {}
    puts ranking_prompt
    puts "1) Campus appearance"
      rankings["campus"] = $stdin.gets.chomp
    puts "2) Dorms"
      rankings["dorms"] = $stdin.gets.chomp
    puts "3) Dining services (Food quality)"
      rankings["dining"] = $stdin.gets.chomp
    puts "4) Dining services (Special diets accessibility)"
      rankings["diets"] = $stdin.gets.chomp
    puts "5) Classes/majors offerings"
      rankings["majors"] = $stdin.gets.chomp
    puts "6) Library facilities"
      rankings["library"] = $stdin.gets.chomp
    puts "7) Classroom facilities"
      rankings["classrooms"] = $stdin.gets.chomp
    puts "8) Student center"
      rankings["s_center"] = $stdin.gets.chomp
    puts "9) The students themselves"
      rankings["students"] = $stdin.gets.chomp
    puts "10) Surrounding town/city"
      rankings["town"] = $stdin.gets.chomp
    puts "11) Intramural sports"
      rankings["sports"] = $stdin.gets.chomp
    puts "12) Other activities and clubs"
      rankings["clubs"] = $stdin.gets.chomp
    add_rankings(rankings)
  end

  def add_rankings(rankings)
    scores = Visit.last.build_ranking(
    dorms: rankings["dorms"],
    campus: rankings["campus"],
    food_campus: rankings["dining"],
    majors: rankings["majors"],
    town: rankings["town"],
    library: rankings["library"],
    students: rankings["students"],
    classrooms: rankings["classrooms"],
    student_center: rankings["s_center"],
    intramural_sports: rankings["sports"],
    other_activities: rankings["clubs"],
    diets: rankings["diets"]
    )
    if scores.save
      puts "\n" + "    Your tracker has been updated! Enter ./trax to return to the menu."
    else
      puts "\n" + "    Failure :( #{visit.errors.full_messages.join(", ")}"
    end
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
      puts "#{i+1}. #{visit.school_name} Average rank: #{visit.rankings}"
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