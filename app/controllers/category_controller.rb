class CategoryController < ApplicationController

    before_action :get_params
    

  def create
   @category = @user.category.new(category_params)
if @category.save
   render json: {category_id:@category.id, user:@category.name, token:@user.token}
else
  render json: { message:"already have that category", categories:@user.category.all}
end
  end

 
def show
    @category = @user.category.all
       
    render json: @category
  end


  def update
   @category = @user.category.find(params[:id])

    if @category.update(category_params)

      render json: {user:@user.category.all}
    else
      render json: {message: "Edit failed"}
    end
  end


  def destroy
   @category = @user.category.find(params[:id])
    @category.destroy
    render json: {user:"destroyed", users: @user.category.all}
  end

  private

def get_params
     @user=User.find_by_token(params[:token])
end

    def category_params
      params.require(:category).permit(:name, :details)
    end

end
