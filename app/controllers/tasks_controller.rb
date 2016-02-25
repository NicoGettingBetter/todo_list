class TasksController < ApplicationController
  def create
  	@task = Task.new params.require(:task).permit(:priority, :name, :deadline, :list_id)
    higher_tasks = (List.find @task.list_id).tasks.select { |task| task.priority >= @task.priority }.sort { |task1, task2| task1.priority <=> task2.priority }.reverse
    for task in higher_tasks do
      task.priority += 1
      task.save
    end

  	if @task.save
  		redirect_to root_path
  	end
  end

  def destroy
  	@task = Task.find params[:id]
    temp_priority = @task.priority
  	@task.destroy
    higher_tasks = (List.find @task.list_id).tasks.select { |task| task.priority >= @task.priority }.sort { |task1, task2| task1.priority <=> task2.priority }
    for task in higher_tasks do
      task.priority -= 1
      task.save
    end
    redirect_to root_path
  end

  def update
    @task = Task.find params[:id]
    @task.update params.require(:task).permit(:status, :name, :deadline)
    redirect_to root_path    
  end
end


