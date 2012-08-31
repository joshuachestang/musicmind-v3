require "spec_helper"

describe UserSongUploadsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_song_uploads").should route_to("user_song_uploads#index")
    end

    it "routes to #new" do
      get("/user_song_uploads/new").should route_to("user_song_uploads#new")
    end

    it "routes to #show" do
      get("/user_song_uploads/1").should route_to("user_song_uploads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_song_uploads/1/edit").should route_to("user_song_uploads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_song_uploads").should route_to("user_song_uploads#create")
    end

    it "routes to #update" do
      put("/user_song_uploads/1").should route_to("user_song_uploads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_song_uploads/1").should route_to("user_song_uploads#destroy", :id => "1")
    end

  end
end
