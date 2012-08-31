require "spec_helper"

describe SongUpVotesController do
  describe "routing" do

    it "routes to #index" do
      get("/song_up_votes").should route_to("song_up_votes#index")
    end

    it "routes to #new" do
      get("/song_up_votes/new").should route_to("song_up_votes#new")
    end

    it "routes to #show" do
      get("/song_up_votes/1").should route_to("song_up_votes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/song_up_votes/1/edit").should route_to("song_up_votes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/song_up_votes").should route_to("song_up_votes#create")
    end

    it "routes to #update" do
      put("/song_up_votes/1").should route_to("song_up_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/song_up_votes/1").should route_to("song_up_votes#destroy", :id => "1")
    end

  end
end
