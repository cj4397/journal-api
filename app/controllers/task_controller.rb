class TaskController < ApplicationController

  before_action :get_params

def create
   @task = @category.task.new(task_params)
if @task.save
   render json: @category.task.all
else
  render json: { message:"already have that task",tasks:@category.task.all}
end
  end

 def update
   @task = @category.task.find(params[:id])

    if @task.update(task_params)
      render json: {user:@category.task.all}
    else
      render json: {message: "Edit failed"}
    end
  end


  def destroy
    @task = @category.task.find(params[:id])
    @task.destroy
    render json: {user:"destroyed", users: @category.task.all}
  end


  private

def get_params
    @user=User.find(params[:user_id])
 @category = @user.category.find(params[:category_id])
end

    def task_params
      params.require(:task).permit(:name, :task)
    end

end
