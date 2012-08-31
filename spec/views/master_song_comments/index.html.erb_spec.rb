require 'spec_helper'

describe "master_song_comments/index" do
  before(:each) do
    assign(:master_song_comments, [
      stub_model(MasterSongComment,
        :user_id => 1,
        :master_song_id => 2,
        :comment => "MyText"
      ),
      stub_model(MasterSongComment,
        :user_id => 1,
        :master_song_id => 2,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of master_song_comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
