class Visit < ActiveRecord::Base
  has_one :ranking, :dependent => :destroy
  validates_associated :ranking
  validates :school_name, :uniqueness => true
  def formatted_date
    self.visit_date.strftime("%m/%d/%y") if !self.visit_date.nil?
  end
end
