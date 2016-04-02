require 'rails_helper'

RSpec.describe FamiliesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status :success
    end
    
    it "render families/new" do
      get :new
      expect(response).to render_template :new
    end
  end

   describe "Post #new" do
    it "returns http success" do
      post :create # need to add valid parameters for user
      expect(response).to have_http_status :success
    end
    
  end

    describe "View #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status :success
    end
    
    it "render families/new" do
      get :index
      expect(response).to render_template :index
    end
  end

end
