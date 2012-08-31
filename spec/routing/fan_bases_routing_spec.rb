require "spec_helper"

describe FanBasesController do
  describe "routing" do

    it "routes to #index" do
      get("/fan_bases").should route_to("fan_bases#index")
    end

    it "routes to #new" do
      get("/fan_bases/new").should route_to("fan_bases#new")
    end

    it "routes to #show" do
      get("/fan_bases/1").should route_to("fan_bases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fan_bases/1/edit").should route_to("fan_bases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fan_bases").should route_to("fan_bases#create")
    end

    it "routes to #update" do
      put("/fan_bases/1").should route_to("fan_bases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fan_bases/1").should route_to("fan_bases#destroy", :id => "1")
    end

  end
end
