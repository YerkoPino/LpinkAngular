require "rails_helper"

RSpec.describe ProyectosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/proyectos").to route_to("proyectos#index")
    end

    it "routes to #new" do
      expect(:get => "/proyectos/new").to route_to("proyectos#new")
    end

    it "routes to #show" do
      expect(:get => "/proyectos/1").to route_to("proyectos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/proyectos/1/edit").to route_to("proyectos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/proyectos").to route_to("proyectos#create")
    end

    it "routes to #update" do
      expect(:put => "/proyectos/1").to route_to("proyectos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/proyectos/1").to route_to("proyectos#destroy", :id => "1")
    end

  end
end
