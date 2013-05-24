
class ChangeBooleanToTextVisits < ActiveRecord::Migration
  def change
    change_column(:visits, :in_session, :text)
    change_column(:visits, :tour, :text)
    change_column(:visits, :interview, :text)
    change_column(:visits, :info_session, :text)
    change_column(:visits, :overnight, :text)
    change_column(:visits, :class_visit, :text)
  end
end
