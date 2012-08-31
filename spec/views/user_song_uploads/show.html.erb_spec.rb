require 'spec_helper'

describe "user_song_uploads/show.html.erb" do
  before(:each) do
    @user_song_upload = assign(:user_song_upload, stub_model(UserSongUpload,
      :user_id => 1,
      :title => "Title",
      :artist => "Artist",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Artist/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
  end
end
