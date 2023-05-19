json.tasks do
  json.array! @tasks.includes(:child_tasks) do |task|
    json.id         task.id
    json.content    task.content
    json.completed  task.completed
    json.created_at task.created_at
    json.parent_task_id task.parent_task_id
    json.child_tasks task.child_tasks
  end
end
