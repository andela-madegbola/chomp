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

      it "should fetch the existing url" do
        expect { xhr :post, :new, target: "google.com" }.not_to change{ Url.count }
      end
    end

    context "When a registered user shorten a new url" do
      before do
        create(:user)
        session[:user_id] = 1
      end

      it "should update its total_links" do
        xhr :post, :new, target: "google.com"

        expect(User.first.total_links).to eq 1
      end
    end

    context "When a slug is passed along with the url" do
      it "should create a new url with slug" do
        xhr :post, :new, target: "google.com", slug: "dude"

        expect(Url.first.slug).to eq "dude"
      end
    end

    context "when the title is not retrieved" do
      it "should replace with a custom title" do
        xhr :post, :new, target: "googlefakeqwer.com"

        expect(Url.first.title).to eq "Title not found"
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

  describe "GET #edit" do
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

  describe "Get #navigate" do

    context "when the URL  is active" do
      let(:url) { create(:url) }

      it "should redirect to the target" do
        get :navigate, slug: url.slug
        expect(response).to redirect_to url.target
      end
    end

    context "when the URL  is inactive" do
      let(:url) { create(:url, status: false) }

      it "should redirect to the homepage" do
        get :navigate, slug: url.slug
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "Delete #destroy" do
    let(:user) { create(:user) }
    before do
      create(:url, user_id: user.id)
      session[:user_id] = 1
    end

    it "should delete the url" do
      expect { delete :destroy, id: user.id }.to change{ Url.count }.by (-1)
    end
  end

  describe "GET #update" do
    let(:user) { create(:user) }
    before do
      create(:url, user_id: user.id)
      session[:user_id] = 1
    end

    context "when user enters valid target and slug" do
      it "should update successfully" do
        get :update, id: user.id, url: {  slug:"ayo" }
        expect(Url.last.slug).to eq "ayo"
      end
    end
  end
end