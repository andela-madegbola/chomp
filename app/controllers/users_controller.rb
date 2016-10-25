class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Chomp!"
      log_in(@user)
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "Your user profile has been updated."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end
end
