require 'rails_helper'

RSpec.describe PrincipalController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #test" do
    it "returns http success" do
      get :test
      expect(response).to have_http_status(:success)
    end
  end

end
