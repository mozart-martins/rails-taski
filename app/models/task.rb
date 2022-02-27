class Task < ApplicationRecord
  belongs_to :project

  after_save :update_percent_complete if :mark_completed? == true

  scope :completed, -> { where(completed: true) }

  def mark_completed?
    self.completed == true
  end

  def update_percent_complete
    project = Project.find(self.project_id)
    count_of_completed_task = project.task.completed.count
    count_of_total_task = project.task.count
    project.update!(percent_complete: Counter.calculate_percentege_complete(
      count_of_completed_task, count_of_total_task))
  end
end
