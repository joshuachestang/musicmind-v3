require "spec_helper"

describe UserProfilePicsController do
  describe "routing" do


    it "routes to #index" do
      get("/user_profile_pics").should route_to("user_profile_pics#index")
    end


    it "routes to #new" do
      get("/user_profile_pics/new").should route_to("user_profile_pics#new")
    end

    it "routes to #show" do
      get("/user_profile_pics/1").should route_to("user_profile_pics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_profile_pics/1/edit").should route_to("user_profile_pics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_profile_pics").should route_to("user_profile_pics#create")
    end

    it "routes to #update" do
      put("/user_profile_pics/1").should route_to("user_profile_pics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_profile_pics/1").should route_to("user_profile_pics#destroy", :id => "1")
    end

  end
end
