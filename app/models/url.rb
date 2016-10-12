class Url < ActiveRecord::Base
  belongs_to :user

  def self.popular
    order(frequency: :desc).limit(10)
  end

  def self.recent
    order(updated_at: :desc).limit(10)
  end
end
