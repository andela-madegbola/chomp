class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def new
    new_target = params[:target]
    @slug = params[:slug]
    new_target = "http://" + new_target if new_target[0..3] != "http"
    find_or_create_url(new_target)
  end

  def navigate
    url = Url.find_by(slug: params[:slug])
    if url && url.status
      url.clicks += 1
      url.update_attribute(:clicks, url.clicks)
      redirect_to url.target
    else
      redirect_to root_path, alert: Message.inactive_link
    end
  end

  def show
  end

  def edit
  end

  def update
    @url.update(url_params)
    redirect_to dashboard_path, notice: Message.url_update_success
  end

  def destroy
    if @url.destroy
      redirect_to dashboard_path, alert: Message.url_deleted
    end
  end

  private

  def find_or_create_url(new_target)
    url = Url.find_by(target: new_target)
    if url && url.user == current_user
      url.slug ||= @slug if @slug
      url.title = set_title(url.target)
      @url = url if url.save
    else
      create(new_target)
    end
  end

  def create(new_target)
    @url = Url.new(target: new_target)
    @url.slug = find_or_create_slug(@slug)
    @url.user_id = current_user.id if current_user
    @url.title = set_title(@url.target)
    if @url.save && current_user
      current_user.total_links += 1
      current_user.update_attribute(:total_links, current_user.total_links)
    end
  end

  def find_or_create_slug(slug)
    if slug.present?
      slug
    else
      SecureRandom.hex(3)
    end
  end

  def set_title(target)
    scraper = Mechanize.new
    page = scraper.get(target)
    page.title
  rescue
    "Title not found"
  end

  def url_params
    params.require(:url).permit(:target, :slug, :status)
  end

  def set_url
    @url = current_user.urls.find_by(id: params[:id])
  end
end
