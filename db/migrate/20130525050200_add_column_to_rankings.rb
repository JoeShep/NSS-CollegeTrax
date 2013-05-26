
class AddColumnToRankings < ActiveRecord::Migration
  def change
    change_table :rankings do |t|
      t.integer :visit_id
    end
  end
end
