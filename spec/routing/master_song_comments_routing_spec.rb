require "spec_helper"

describe MasterSongCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/master_song_comments").should route_to("master_song_comments#index")
    end

    it "routes to #new" do
      get("/master_song_comments/new").should route_to("master_song_comments#new")
    end

    it "routes to #show" do
      get("/master_song_comments/1").should route_to("master_song_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/master_song_comments/1/edit").should route_to("master_song_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/master_song_comments").should route_to("master_song_comments#create")
    end

    it "routes to #update" do
      put("/master_song_comments/1").should route_to("master_song_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/master_song_comments/1").should route_to("master_song_comments#destroy", :id => "1")
    end

  end
end
