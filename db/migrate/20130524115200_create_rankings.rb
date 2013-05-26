
class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.float :dorms
      t.float :campus
      t.float :food_campus
      t.float :food_off_campus
      t.float :majors
      t.float :town
      t.float :library
      t.float :students
      t.float :classrooms
      t.float :student_center
      t.float :intramural_sports
      t.float :other_activities
    end
  end
end
