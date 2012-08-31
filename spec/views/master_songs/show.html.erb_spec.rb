require 'spec_helper'

describe "master_songs/show.html.erb" do
  before(:each) do
    @master_song = assign(:master_song, stub_model(MasterSong,
      :title => "Title",
      :artist => "Artist",
      :album => "Album",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Artist/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Album/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
  end
end
