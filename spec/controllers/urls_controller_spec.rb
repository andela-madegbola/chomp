require "rails_helper"

RSpec.describe UrlsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:link) { Link.create(FactoryGirl.attributes_for(:link)) }


end