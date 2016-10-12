class UrlsController < ApplicationController

  def new
    target_url = params[:target]
    @vanity = params[:vanity]
    new_target = 'http://' + target_url if target_url[0..3] != 'http'
    if Url.all.empty?
      create(new_target)
    else
      update_frequency(new_target)
    end
  end

  def create(new_target)
    @url = Url.new(target: new_target)
    # binding.pry
    if @vanity.present?
      @url.slug = @vanity
    else
      @url.slug = SecureRandom.hex(3)
    end
    # binding.pry
    @url.user_id = current_user.id if current_user
    @url.save
  end

  def update_frequency(new_target)
    binding.pry
    Url.all.detect do |url|
      if url.target == new_target
        new_frequency = url.frequency + 1
        @url = url if url.update(frequency: new_frequency)
      end
    end
    binding.pry
    create(new_target) unless @url
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