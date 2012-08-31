require 'spec_helper'

describe "master_songs/edit.html.erb" do
  before(:each) do
    @master_song = assign(:master_song, stub_model(MasterSong,
      :title => "MyString",
      :artist => "MyString",
      :album => "MyString",
      :file => "MyString"
    ))
  end

  it "renders the edit master_song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => master_songs_path(@master_song), :method => "post" do
      assert_select "input#master_song_title", :name => "master_song[title]"
      assert_select "input#master_song_artist", :name => "master_song[artist]"
      assert_select "input#master_song_album", :name => "master_song[album]"
      assert_select "input#master_song_file", :name => "master_song[file]"
    end
  end
end
