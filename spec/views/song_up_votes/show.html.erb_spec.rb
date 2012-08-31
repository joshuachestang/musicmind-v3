require 'spec_helper'

describe "song_up_votes/show" do
  before(:each) do
    @song_up_vote = assign(:song_up_vote, stub_model(SongUpVote))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
