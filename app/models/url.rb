class Url < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :target
  validates_presence_of :slug
  validates_presence_of :frequency

  def self.popular
    order(frequency: :desc).limit(5)
  end

  def self.recent
    order(updated_at: :desc).limit(5)
  end

  def self.my_urls(user)
    where(user_id: user.id).order(frequency: :desc)
  end
end
