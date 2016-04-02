RSpec.describe HomeController do
  describe "GET index" do
    it "it has http status 200" do
      get :index
      expect(response).to have_http_status :success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end