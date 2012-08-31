require 'spec_helper'

describe "album_tracks/new" do
  before(:each) do
    assign(:album_track, stub_model(AlbumTrack,
      :album_id => 1,
      :ms_id => 1,
      :create => "MyString",
      :destroy => "MyString"
    ).as_new_record)
  end

  it "renders new album_track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => album_tracks_path, :method => "post" do
      assert_select "input#album_track_album_id", :name => "album_track[album_id]"
      assert_select "input#album_track_ms_id", :name => "album_track[ms_id]"
      assert_select "input#album_track_create", :name => "album_track[create]"
      assert_select "input#album_track_destroy", :name => "album_track[destroy]"
    end
  end
end
