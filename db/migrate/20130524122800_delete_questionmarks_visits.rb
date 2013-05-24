
class DeleteQuestionmarksVisits < ActiveRecord::Migration
  def change
    rename_column(:visits, :in_session?, :in_session)
    rename_column(:visits, :tour?, :tour)
    rename_column(:visits, :interview?, :interview)
    rename_column(:visits, :info_session?, :info_session)
    rename_column(:visits, :overnight?, :overnight)
    rename_column(:visits, :class_visit?, :class_visit)
  end
end
