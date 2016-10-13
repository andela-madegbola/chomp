require "rails_helper"

RSpec.describe SessionsController do
  let(:user) { create(:user) }

  describe "GET #new" do
    it "should render the 'new' template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "should have have http status 200" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "when user enters correct login details" do
      let(:create_action) do
        post :create, email: user.email, password: user.password
      end

      it "should flash success message " do
        expect(:success).to be_present
      end

      it "should redirect to home page " do
        expect(create_action).to redirect_to(root_path)
      end

      it "should redirect to home page " do
        expect(create_action).to have_http_status(302)
      end
    end

    context "when user enters correct details" do
      let(:create_action) do
        post :create, email: "gjdfhfkd@yahoo.com", password: "dude"
      end

      it "should flash success message " do
        expect(:danger).to be_present
      end

      it "should redirect to home page " do
        expect(create_action).to render_template(:new)
      end

      it "should redirect to home page " do
        expect(create_action).to have_http_status(200)
      end
    end
  end

  describe "DELETE #destroy" do
    it "should redirect to home age" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end

    it "should have have http status 302" do
      delete :destroy
      expect(response).to have_http_status(302)
    end
  end
end
