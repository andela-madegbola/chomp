class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      flash[:notice] = Message.logged_in
      redirect_to root_path
    else
      flash.now[:danger] = Message.log_in_error
      render "new"
    end
  end

  def destroy
    log_out
    flash[:danger] = Message.logged_out
    redirect_to root_path
  end
end
