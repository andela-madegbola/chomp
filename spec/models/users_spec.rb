require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should be_valid }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  describe "influential users" do
    let(:user) { create(:user) }
    before { 10.times { |n| create(:url, user_id: user.id, clicks: n+1 ) } }

    it "should sort the users by no. of clicks" do
      expect(User.influential.first.username).to eq User.last.username
    end
  end
end
