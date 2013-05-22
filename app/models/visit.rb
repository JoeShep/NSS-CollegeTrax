class Visit < ActiveRecord::Base

  def formatted_date
    self.visit_date.strftime("%m/%d/%Y")
  end
end
