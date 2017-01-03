class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  # Since user_params will only be used internally by the Users controller
   # and need not be exposed to external users via the web, we’ll make it private. 
  private
  
  # To facilitate the use of these parameters, it’s conventional to
  # use an auxiliary method called user_params which returns an 
  # appropriate initialization hash and use it in place of params[:user]:
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
