class Ranking < ActiveRecord::Base
  belongs_to :visit, :foreign_key => 'visit_id'
  validates :dorms, :numericality => true
end
