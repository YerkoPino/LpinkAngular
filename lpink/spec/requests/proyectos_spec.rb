require 'rails_helper'

RSpec.describe "Proyectos", type: :request do
  describe "GET /proyectos" do
    it "works! (now write some real specs)" do
      get proyectos_path
      expect(response).to have_http_status(200)
    end
  end
end
