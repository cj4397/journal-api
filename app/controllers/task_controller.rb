class TaskController < ApplicationController

  before_action :get_params

  def create
      @task = @user.task.new(task_params)
      if @task.save
         render json: @user.task.all
      else
          render json: { message:"already have that task",tasks:@user.task.all}
      end
  end

  def show
    @category = @user.category
        @user.task.each do |x|
          if !x.category_id.nil?
          x.category=@category.find(x.category_id).name
          end
        end
    render json: @user.task.all
  end

  def move
     @task = @user.task.find_by_task(params[:task])
     @category = @user.category.find_by_name(params[:category_name])
     @task.category_id=@category.id
     render json: @task
  end

#  def category_create
#   @task = @user.task.new(category_task_params)
#    if @task.save
#          render json: @user.task.all
#       else
#           render json: { message:"already have that task",tasks:@user.task.all}
#       end

#  end


  def update
    @task = @user.task.find(params[:id])

      if @task.update(task_params)
        render json: {user:@user .task.all}
      else
        render json: {message: "Edit failed"}
      end
  end


  def destroy
    @task = @user.task.find(params[:id])
    @task.destroy
    render json: {user:"destroyed", users: @user.task.all}
  end


  private

def get_params
    @user=User.find_by_token(params[:token])
end

    def task_params
      params.require(:task).permit(:task, :details)
    end

    
    # def category_task_params
    #   params.require(:task).permit(:name, :task, :category_id)
    # end


end
