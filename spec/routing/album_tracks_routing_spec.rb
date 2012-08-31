require "spec_helper"

describe AlbumTracksController do
  describe "routing" do

    it "routes to #index" do
      get("/album_tracks").should route_to("album_tracks#index")
    end

    it "routes to #new" do
      get("/album_tracks/new").should route_to("album_tracks#new")
    end

    it "routes to #show" do
      get("/album_tracks/1").should route_to("album_tracks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/album_tracks/1/edit").should route_to("album_tracks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/album_tracks").should route_to("album_tracks#create")
    end

    it "routes to #update" do
      put("/album_tracks/1").should route_to("album_tracks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/album_tracks/1").should route_to("album_tracks#destroy", :id => "1")
    end

  end
end
