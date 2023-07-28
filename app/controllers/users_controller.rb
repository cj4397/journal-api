class UsersController < ApplicationController


  def show
    @user = User.find_by_email(params[:email])
    render json: {user:@user}, status: 200
  end



  def create
    if param_check
    @user = User.new(user_params)
   @user.password = params[:password] 
      if @user.valid? && @user.save
        response.headers['Access-Control-Allow-Origin'] = '*'
      render json: { user:@user.name, token: @user.token}, status: 200
        else
        render json:{ message: "Email invalid/duplicated", users:User.all}, status: 406
      end
    else 
    render json: {message:"password not 6 character and above"}, status: 411
    end
  end

  def signin
     @user = User.find_by_email(params[:email])
     if @user
     if @user.password == params[:password]
      render json: {user:@user.name, token:@user.token}, status: 200
     else
       render json: {message:'none'}, status: 406
     end
    else
       render json: {message:'no such email is registered'}, status: 406
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
    @user = User.find(params[:id])
    @user.destroy
render json: {user:"destroyed", users: User.all}
  end



  
  private

  def signup_params
    params.require(:user).permit(:email, :password)
  end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def param_check 
      if params[:password].length > 6
       true
      else 
        false
      end
    end






end
