class Visit < ActiveRecord::Base

  def formatted_date
    self.visit_date.strftime("%m/%d/%y")
  end
end
