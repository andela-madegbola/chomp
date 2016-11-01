require "rails_helper"

RSpec.describe UrlsController do

  describe "Post #new" do

    context "When a new URL is entered" do
      it "should should increase url count" do
        expect { xhr :post, :new, target: "google.com" }.to change{ Url.count }.by 1
      end
    end

    context "When an existing URL is entered" do
      before { create(:url, target: "http://google.com") }
      it "should should fetch the existing url" do
        expect { xhr :post, :new, target: "google.com" }.not_to change{ Url.count }
      end
    end
  end

  describe "Get #show" do
    let(:user) { create(:user) }
    before do
      create(:url, user_id: user.id)
      session[:user_id] = 1
    end

    it "should render the 'show' template" do
      xhr :get, :show, id: 1
      expect(response).to render_template(:show)
    end

    it "should have have http status 200" do
      xhr :get, :show, id: user.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Get #edit" do
    let(:user) { create(:user) }
    before do
      create(:url, user_id: user.id)
      session[:user_id] = 1
    end

    it "should render the 'edit' template" do
      xhr :get, :edit, id: 1
      expect(response).to render_template(:edit)
    end

    it "should have have http status 200" do
      xhr :get, :edit, id: user.id
      expect(response).to have_http_status(:ok)
    end
  end
end