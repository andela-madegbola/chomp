class PagesController < ApplicationController
  def index
    @popular_urls = Url.popular
    @recent_urls = Url.recent
  end

  def contact
  end

  def about
  end

  def dashboard
    if current_user
      @my_urls = Url.my_urls(current_user)
    else
      redirect_to root_path
    end
  end
end
