class UrlsController < ApplicationController

  def new
    target_url = params[:target]
    @slug = params[:slug]
    new_target = 'http://' + target_url if target_url[0..3] != 'http'
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
      if url.target == new_target
        url.frequency = url.frequency + 1
        url.slug = find_or_create_slug(@slug) unless url.slug
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