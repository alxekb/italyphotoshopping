require "rails_helper"

RSpec.describe Profile::ItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/profile/items").to route_to("profile/items#index")
    end

    it "routes to #new" do
      expect(:get => "/profile/items/new").to route_to("profile/items#new")
    end

    it "routes to #show" do
      expect(:get => "/profile/items/1").to route_to("profile/items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/profile/items/1/edit").to route_to("profile/items#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/profile/items").to route_to("profile/items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/profile/items/1").to route_to("profile/items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/profile/items/1").to route_to("profile/items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/profile/items/1").to route_to("profile/items#destroy", :id => "1")
    end
  end
end
