require "rails_helper"

RSpec.describe Url, type: :model do
  subject { build(:url) }

  it { should be_valid }
  it { should respond_to(:target) }
  it { should respond_to(:slug) }
  it { should respond_to(:frequency) }
  it { should respond_to(:user) }
end
