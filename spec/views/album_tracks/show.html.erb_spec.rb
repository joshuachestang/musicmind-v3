require 'spec_helper'

describe "album_tracks/show" do
  before(:each) do
    @album_track = assign(:album_track, stub_model(AlbumTrack,
      :album_id => 1,
      :ms_id => 1,
      :create => "Create",
      :destroy => "Destroy"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Create/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Destroy/)
  end
end
