class CollegeTraxController

  def initialize params
    @params = params
  end

  def create_visit
    visit = Visit.new(params[:visit])
    if visit.save
      puts "Success!"
    else
      puts "Failure :( #{visit.errors.full_messages.join(", ")}"
    end
  end

  def index
    visits = Visit.all
    visits.each_with_index do |visit, i|
      puts "#{i+1}. #{visit.school_name} visited on #{visit.formatted_date}. My overall rank: #{visit.ranking} out of 5"
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