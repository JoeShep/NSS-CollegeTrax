
class AddDietsToRankings < ActiveRecord::Migration
  def change
    change_table :rankings do |t|
      t.float :diets
    end
  end
end
