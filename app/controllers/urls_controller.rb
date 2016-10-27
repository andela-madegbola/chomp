class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def new
    new_target = params[:target]
    @slug = params[:slug]
    new_target = "http://" + new_target if new_target[0..3] != "http"
    if Url.all.empty?
      create(new_target)
    else
      update_frequency(new_target)
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

  def update_frequency(new_target)
    url = Url.find_by(target: new_target)
    if url && url.user == current_user
      url.frequency += 1
      url.slug = @slug if @slug
      @url = url if url.save
    else
      create(new_target)
    end
  end

  def navigate
    url = Url.find_by(slug: params[:slug])
    if url && url.status
      redirect_to url.target
    else
      redirect_to root_path, notice: "Oops, this link has been made inactive by its owner"
    end
  end

  def set_title(target)
    scraper = Mechanize.new
    page = scraper.get(target)
    page.title
  rescue
    "Title could not be retrieved"
  end

  def show
  end

  def edit
  end

  def update
    if @url.update(url_params)
      redirect_to dashboard_path, notice: "Your URL was successfully updated"
    else
      flash[:alert] = "Please review your info"
    end
  end

  def destroy
    if @url.destroy
      redirect_to dashboard_path, notice: "Your URL was successfully deleted"
    end
  end

  private

  def url_params
    params.require(:url).permit(:target, :slug, :status)
  end

  def set_url
    @url = current_user.urls.find_by(id: params[:id])
  end
end
