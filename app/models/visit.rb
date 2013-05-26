class Visit < ActiveRecord::Base
  has_one :ranking, :dependent => :destroy
  def formatted_date
    self.visit_date.strftime("%m/%d/%y")
  end
end
