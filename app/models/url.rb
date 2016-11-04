class Url < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :target
  validates_presence_of :slug
  validates_presence_of :title

  scope :popular, -> { order(clicks: :desc).limit(4) }
  scope :recent, -> { order(updated_at: :desc).limit(4) }
  scope :my_urls, -> (user) { where(user_id: user.id).order(clicks: :desc) }
end
