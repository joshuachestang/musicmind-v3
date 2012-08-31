require 'spec_helper'

describe "FanBases" do
  describe "GET /fan_bases" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get fan_bases_path
      response.status.should be(200)
    end
  end
end
