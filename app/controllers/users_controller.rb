class UsersController < ApplicationController

#  def index
#     @users = User.all
#     render json: {user:@users}, status: 200
#   end

  def show
    @user = User.find_by_email(params[:email])
    render json: {user:@user}, status: 200
  end


  # def new
  #   @user = User.new
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end


  def create
    @user = User.new(user_params)
   
      if @user.save
      render json: {user:User.all}, status: 200
        else
        render json:{ message: "Email invalid/duplicated", test: user_params[:password], users:User.all}
      end

  end

  def signin
     @user = User.find_by_email(params[:email])
     if @user 
      render json: {user:User.all}
     else
       render json: 'none', status: 422
     end

  end


  def update
    @user = User.find_by_email(params[:email])

    if @user.update(user_params)
      render json: {user:User.all}
    else
      render json: {message: "Edit failed"}
    end
  end


  def destroy
    @user = User.find_by_email(params[:email])
    @user.destroy
render json: {user:"destroyed", users: User.all}
  end



  
  private

  def signup_params
    params.require(:user).permit(:email, :password)
  end

    def user_params
      params.require(:user).permit(:email, :password)
    end




# def signup
#      @users=User.all.collect(&:email)
#      @user = User.new(signup_params)

#     if @user.verify_password(signup_params)
#     if @article.save
#         render json: {user:@users, token:@user.generate_token(@user.email)}

#       else
#         render json: "no", status: 404
#       end
#     end
#   end



#    private
#   def signup_params
#     params.require(:user).permit(:email, :password)
#   end


#   def signin_params
#     params.require(:user).permit(:email, :password)
#   end

end
