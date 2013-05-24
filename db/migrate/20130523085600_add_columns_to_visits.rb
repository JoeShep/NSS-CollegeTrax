
class AddColumnsToVisits < ActiveRecord::Migration
  def change
    change_table :visits do |t|
      t.string :contact_name
      t.string :contat_email
      t.string :contact_phone
      t.boolean :in_session
      t.boolean :tour
      t.boolean :interview
      t.boolean :info_session
      t.boolean :overnight
      t.boolean :class_visit
    end
  end
end
