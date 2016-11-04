require "rails_helper"

describe PagesController do
  describe "GET #dashboard" do
    context "when a registered user access the dashboard" do
      before do
        create(:user)
        session[:user_id] = 1
      end

      it "should render the dashboard template" do
        get :dashboard

        expect(response).to render_template "dashboard"
      end
    end

    context "when an anonymous user access the dashboard" do
      it "should redirect to root page" do
        get :dashboard

        expect(response).to redirect_to root_url
      end
    end
  end
end
