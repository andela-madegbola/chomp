require "rails_helper"

RSpec.describe Url, type: :model do
  it { is_expected.to respond_to(:target) }
  it { is_expected.to respond_to(:slug) }
  it { is_expected.to respond_to(:clicks) }
  it { is_expected.to respond_to(:user) }

  describe "popular" do
    let(:user) { create(:user) }
    before { 10.times { |n| create(:url, user_id: user.id, clicks: n + 1) } }

    it "should return the urls by popularity" do
      expect(Url.popular.first).to eq Url.last
    end
  end

  describe "recent" do
    let(:user) { create(:user) }
    before { 10.times { create(:url, user_id: user.id) } }
    it "should return the urls by time of creation" do
      expect(Url.recent.first).to eq Url.last
    end
  end

  describe "my_urls" do
    let(:user) { create(:user) }
    before { 10.times { create(:url, user_id: user.id) } }
    it "should return the urls for a particular user" do
      expect(Url.my_urls(user).count).to eq 10
    end
  end
end
