require 'spec_helper'

describe "album_tracks/index" do
  before(:each) do
    assign(:album_tracks, [
      stub_model(AlbumTrack,
        :album_id => 1,
        :ms_id => 1,
        :create => "Create",
        :destroy => "Destroy"
      ),
      stub_model(AlbumTrack,
        :album_id => 1,
        :ms_id => 1,
        :create => "Create",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of album_tracks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
