
class CollegeTraxController
  include TextPrompts

  def initialize params
    @params = params
  end

  def create_visit
    if params[:visit][:school_name].nil?
      puts "\n   Enter the name of a school you have visited:"
        name = $stdin.gets.chomp
      puts "   Enter the date of your visit (Month DD, YYYY):"
        date = $stdin.gets.chomp
      visit = Visit.create(school_name: name, visit_date: date)
    else
      visit = Visit.create(params[:visit])
    end
    if visit.save
      puts "\n" + "    Your visit to #{Visit.last.school_name} on #{Visit.last.formatted_date} has been saved to your tracker!"
    else
      puts "\n" + "    Failure :( #{visit.errors.full_messages.join(", ")}"
      params[:visit][:school_name]=nil
      create_visit
    end
    get_visit_data
  end

  def get_visit_data
    visit_data = {}
  puts contact_prompt
  if $stdin.gets.chomp.downcase == "n"
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
    puts "  Was school in session?"
      visit_data["session"] = $stdin.gets.chomp
    puts "  Did you take a guided tour?"
      visit_data["tour"] = $stdin.gets.chomp
    puts "  Did you do an admissions interview?"
      visit_data["interview"] = $stdin.gets.chomp
    puts "  Did you attend an info session?"
      visit_data["info"] = $stdin.gets.chomp
    puts "  Did you stay overnight on campus?"
      visit_data["overnight"] = $stdin.gets.chomp
    puts "  Did you attend any classes?"
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
    $stdin.gets.chomp.downcase == "y" ? get_rankings(Visit.last.school_name) : skip_rankings
  end

  def get_rankings(school=nil)
    if school.nil?
      school= params[:visit][:school_name]
    end
    rankings = {}
    puts ranking_prompt
    puts "  1) My overall ranking for #{school}"
      rankings["overall"] = $stdin.gets.chomp
    puts "  2) Dorms"
      rankings["dorms"] = $stdin.gets.chomp
    puts "  3) Dining services (Food quality)"
      rankings["dining"] = $stdin.gets.chomp
    puts "  4) Dining services (Special diets accessibility)"
      rankings["diets"] = $stdin.gets.chomp
    puts "  5) Classes/majors offerings"
      rankings["majors"] = $stdin.gets.chomp
    puts "  6) Library facilities"
      rankings["library"] = $stdin.gets.chomp
    puts "  7) Classroom facilities"
      rankings["classrooms"] = $stdin.gets.chomp
    puts "  8) Student center"
      rankings["s_center"] = $stdin.gets.chomp
    puts "  9) The students themselves"
      rankings["students"] = $stdin.gets.chomp
    puts "  10) Surrounding town/city"
      rankings["town"] = $stdin.gets.chomp
    puts "  12) Off-campus food choices"
      rankings["food_off_campus"] = $stdin.gets.chomp
    puts "  13) Intramural sports"
      rankings["sports"] = $stdin.gets.chomp
    puts "  14) Other activities and clubs"
      rankings["clubs"] = $stdin.gets.chomp
    puts "  15) Campus appearance"
      rankings["campus"] = $stdin.gets.chomp
    add_rankings(rankings, school)
  end

  def add_rankings(rankings, school)
    scores = Visit.where("school_name = ?", school).first.build_ranking(
    overall: rankings["overall"],
    dorms: rankings["dorms"],
    campus: rankings["campus"],
    food_campus: rankings["dining"],
    majors: rankings["majors"],
    town: rankings["town"],
    food_off_campus: rankings["food_off_campus"],
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

  def index_all
    visits = Visit.all
    visits.each_with_index do |visit, i|
      if i.odd?
      puts "\x1b[7m#{i+1}. #{visit.school_name}, visited on #{visit.formatted_date}.\x1b[0m"
      else
      puts "#{i+1}. #{visit.school_name}, visited on #{visit.formatted_date}."
    end
  end
  end

  def index_school
    school=Visit.where("school_name = ?", params[:visit][:school_name]).first
    puts format_tracker(school)
  end

  def index_rankings
    visits = Visit.order("ranking DESC")
    visits.each_with_index do |visit, i|
      puts "\x1b[7m" + "#{i+1}. #{visit.school_name}. My overall rank: #{visit.ranking["overall"]}" + "\x1b[0m"
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