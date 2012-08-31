require 'spec_helper'

describe "song_up_votes/new" do
  before(:each) do
    assign(:song_up_vote, stub_model(SongUpVote).as_new_record)
  end

  it "renders new song_up_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => song_up_votes_path, :method => "post" do
    end
  end
end
