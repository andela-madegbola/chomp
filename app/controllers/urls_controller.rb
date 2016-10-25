class UrlsController < ApplicationController
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
    @url.save
  end

  def update_frequency(new_target)
    Url.all.detect do |url|
      if url.target == new_target && url.user == current_user
        url.frequency = url.frequency + 1
        url.slug = find_or_create_slug(@slug)
        @url = url if url.save
      end
    end
    create(new_target) unless @url
  end

  def find_or_create_slug(slug)
    if slug.present?
      slug
    else
      SecureRandom.hex(3)
    end
  end

  def navigate
    url = Url.find_by(slug: params[:slug])
    if url
      redirect_to url.target
    else
      redirect_to root_path
    end
  end
end
