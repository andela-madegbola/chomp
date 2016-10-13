require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should be_valid }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

end