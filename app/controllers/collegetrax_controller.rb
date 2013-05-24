
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
    else
      puts "Failure :( #{visit.errors.full_messages.join(", ")}"
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