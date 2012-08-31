require 'spec_helper'

describe "song_up_votes/index" do
  before(:each) do
    assign(:song_up_votes, [
      stub_model(SongUpVote),
      stub_model(SongUpVote)
    ])
  end

  it "renders a list of song_up_votes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
