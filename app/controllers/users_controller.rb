class UsersController < ApplicationController
  skip_before_action :login_required
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to users_path
    else
      render 'new'
    end
  end
 private

 def user_params
  params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :admin)
 end

end
