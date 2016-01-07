require 'rails_helper'

RSpec.describe FamiliesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

   describe "Post #new" do
    it "returns http success" do
      get :post
      expect(response).to have_http_status(:success)
    end
  end

    describe "View #index" do
    it "returns http success" do
      get :view
      expect(response).to have_http_status(:success)
    end
  end

end
