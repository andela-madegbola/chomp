class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = logged_in
      log_in(@user)
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = edit_profile_success
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def authenticate_user
    @user = User.find_by(id: session[:user_id])
    return @user if @user
    flash[:danger] = unauthorized_user
    redirect_to login_url
  end
end
