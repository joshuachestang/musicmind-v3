require 'spec_helper'

describe "user_song_uploads/edit.html.erb" do
  before(:each) do
    @user_song_upload = assign(:user_song_upload, stub_model(UserSongUpload,
      :user_id => 1,
      :title => "MyString",
      :artist => "MyString",
      :file => "MyString"
    ))
  end

  it "renders the edit user_song_upload form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_song_uploads_path(@user_song_upload), :method => "post" do
      assert_select "input#user_song_upload_user_id", :name => "user_song_upload[user_id]"
      assert_select "input#user_song_upload_title", :name => "user_song_upload[title]"
      assert_select "input#user_song_upload_artist", :name => "user_song_upload[artist]"
      assert_select "input#user_song_upload_file", :name => "user_song_upload[file]"
    end
  end
end
