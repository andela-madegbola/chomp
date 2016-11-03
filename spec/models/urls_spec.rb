require "rails_helper"

RSpec.describe Url, type: :model do
  subject { build(:url) }
  it { should be_valid }
  it { is_expected.to respond_to(:target) }
  it { is_expected.to respond_to(:slug) }
  it { is_expected.to respond_to(:clicks) }
  it { is_expected.to respond_to(:user) }
end
