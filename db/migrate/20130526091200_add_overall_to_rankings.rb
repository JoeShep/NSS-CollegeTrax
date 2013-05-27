
class AddOverallToRankings < ActiveRecord::Migration
  def change
    change_table :rankings do |t|
      t.float :overall
    end
  end
end
