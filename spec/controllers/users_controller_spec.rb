require "rails_helper"

RSpec.describe UsersController do
  let(:valid_user_params) do
    {
      username: "qwerty",
      email: "qwerty@qwe.com",
      password: "qwerty",
      password_confirmation: "qwerty"
    }
  end

  let(:invalid_user_params) do
    {
      username: "qwerty",
      email: "qwerty@qwe.com",
      password: "qwertyqw",
      password_confirmation: "qwert"
    }
  end

  describe "GET #new" do
    it "should render the 'new' template " do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "when user enters correct signup details" do
      let(:create_action) { post :create, user: valid_user_params }

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
      let(:create_action) { post :create, user: invalid_user_params }

      it "should flash success message " do
        expect(:notice).to be_present
      end

      it "should redirect to home page " do
        expect(create_action).to render_template(:new)
      end

      it "should redirect to home page " do
        expect(create_action).to have_http_status(200)
      end
    end
  end
end
