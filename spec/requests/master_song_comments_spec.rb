require 'spec_helper'

describe "MasterSongComments" do
  describe "GET /master_song_comments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get master_song_comments_path
      response.status.should be(200)
    end
  end
end
