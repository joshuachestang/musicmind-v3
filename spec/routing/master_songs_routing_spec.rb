require "spec_helper"

describe MasterSongsController do
  describe "routing" do

    it "routes to #index" do
      get("/master_songs").should route_to("master_songs#index")
    end

    it "routes to #new" do
      get("/master_songs/new").should route_to("master_songs#new")
    end

    it "routes to #show" do
      get("/master_songs/1").should route_to("master_songs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/master_songs/1/edit").should route_to("master_songs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/master_songs").should route_to("master_songs#create")
    end

    it "routes to #update" do
      put("/master_songs/1").should route_to("master_songs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/master_songs/1").should route_to("master_songs#destroy", :id => "1")
    end

  end
end
