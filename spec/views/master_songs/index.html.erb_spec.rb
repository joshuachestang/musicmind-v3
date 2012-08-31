require 'spec_helper'

describe "master_songs/index.html.erb" do
  before(:each) do
    assign(:master_songs, [
      stub_model(MasterSong,
        :title => "Title",
        :artist => "Artist",
        :album => "Album",
        :file => "File"
      ),
      stub_model(MasterSong,
        :title => "Title",
        :artist => "Artist",
        :album => "Album",
        :file => "File"
      )
    ])
  end

  it "renders a list of master_songs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Album".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
