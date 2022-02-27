json.extract! task, :id, :title, :description, :completed, :created_at, :updated_at, :project_id
json.url task_url(task, format: :json)
