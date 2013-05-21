
class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :school_name
      t.date :visit_date
      t.float :ranking
    end
  end
end
