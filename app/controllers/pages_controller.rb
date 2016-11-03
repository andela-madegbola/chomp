class PagesController < ApplicationController
  def index
    @popular_urls = Url.popular
    @recent_urls = Url.recent
    @influential_users = User.influential
  end

  def contact
  end

  def about
  end

  def dashboard
    if current_user
      @my_urls = Url.paginate(:page => params[:page], :per_page => 5).my_urls(current_user)
    else
      redirect_to root_path
    end
  end
end
