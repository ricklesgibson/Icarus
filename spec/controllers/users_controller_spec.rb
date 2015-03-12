require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    before(:each) do
      get :new
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
     it "doesn't post to the database" do
      # expect{User.new}.to change(User, :count).by(0)
      expect{User.new}.to_not change(User, :count)
    end
      it "makes a new User" do
      expect(assigns(:user)).to be_a(User)
      end
  end
end

describe "GET #index" do
  before :each do
    get :index
  end

  it "renders the index template" do
    expect(response).to render_template("index")
  end

  it "should have a success 200 response" do
    expect(response).to have_http_status(200)
  end

  it "assigns @users to include all users" do
    expect(assigns(:users)).to include(@user, @user1, @user2)
  end
end


  describe "POST #create" do
    it "UNLIKE 'new,' we POST the user info to the DATABASE" do
      expect{post :create, user: valid_attributes}.to change(User, :count).by(1)
    end

  end


  describe "GET #destroy" do
    before do
      @user=User.create valid_attributes
      get :index
    end

    it "deletes a user from database" do
      expect{delete :destroy, id: @user.id}.to change(Item, :count).by(-1)
    end

    it "redirects to index page" do
      expect(response).to render_template :index
      end
    end
  end

  describe "GET #show" do
    before :each do
      get :user, id: @user.id
    end
    it "renders the show template and returns http success" do
      get :show
      expect(response).to have_http_status(:success)
      expect(response).to render_template :show
    end

    it "assigns a user to @user" do
      expect(assigns(:user)).to eq(@user))
    end

  end

  describe "GET #edit" do
    before :each do
      @test_user=User.create valid_attributes
      get :edit, id: @test_user.id
    end

    it "renders edit template and returns http success" do
      get :edit
      expect(response).to render_template :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT/PATCH #update" do
    before do
      @test_user = User.create valid_attributes
      get :edit, id: @test_user.id
  end

  describe "with successful update" do
    let :new_attributes do
      {
          :email => ""
          :first_name => ""
          :last_name => ""
          :street_address => ""
          :city => ""
          :state => ""
          :zip => ""
      }
    end

    before do
      patch :update, id: @test_user.id
    end

    it "should redirect to the show path for this user" do
      expect(response).to render_template :show
      expect(response).to redirect_to item_path
    end

  end
