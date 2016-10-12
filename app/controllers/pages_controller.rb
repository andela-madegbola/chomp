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
    @my_urls = Url.my_urls(current_user)
  end
end
