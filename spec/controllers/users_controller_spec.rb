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

      it "should redirect to home page " do
        expect(create_action).to redirect_to(root_path)
      end

      it "should redirect to home page " do
        expect(create_action).to have_http_status(302)
      end
    end

    context "when user enters incorrect details" do
      let(:create_action) { post :create, user: invalid_user_params }

      it "should redirect to home page " do
        expect(create_action).to render_template(:new)
      end

      it "should redirect to home page " do
        expect(create_action).to have_http_status(200)
      end
    end
  end

  describe "GET #edit" do
    let(:user) { create(:user) }
    before { session[:user_id] = user.id }

    it "should should render edit page" do
      get :edit, id: user.id

      expect(response).to render_template :edit
    end
  end

  describe "GET #edit" do
    let(:user) { create(:user) }

    context "when user is logged in" do
      before { session[:user_id] = user.id }

      context "when user enters valid details" do
        it "should update successfully" do
          get :update, id: user.id, user: { username: "mayor" }

          expect(User.last.username).to eq "mayor"
        end
      end

      context "when users enters invalid details" do
        it "should render edit page" do
          get :update, id: user.id, user: { username: "mayor" * 20 }

          expect(response).to render_template :edit
        end
      end
    end

    context "when user isn't logged in" do
      it "should redirect to login page" do
        get :update, id: user.id, user: { username: "mayor" }

        expect(response).to redirect_to login_url
      end
    end
  end
end
