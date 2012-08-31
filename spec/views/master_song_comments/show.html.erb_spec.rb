require 'spec_helper'

describe "master_song_comments/show" do
  before(:each) do
    @master_song_comment = assign(:master_song_comment, stub_model(MasterSongComment,
      :user_id => 1,
      :master_song_id => 2,
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
  end
end
