require 'spec_helper'

describe "song_up_votes/edit" do
  before(:each) do
    @song_up_vote = assign(:song_up_vote, stub_model(SongUpVote))
  end

  it "renders the edit song_up_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => song_up_votes_path(@song_up_vote), :method => "post" do
    end
  end
end
