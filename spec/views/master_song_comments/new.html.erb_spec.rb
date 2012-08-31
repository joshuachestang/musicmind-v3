require 'spec_helper'

describe "master_song_comments/new" do
  before(:each) do
    assign(:master_song_comment, stub_model(MasterSongComment,
      :user_id => 1,
      :master_song_id => 1,
      :comment => "MyText"
    ).as_new_record)
  end

  it "renders new master_song_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => master_song_comments_path, :method => "post" do
      assert_select "input#master_song_comment_user_id", :name => "master_song_comment[user_id]"
      assert_select "input#master_song_comment_master_song_id", :name => "master_song_comment[master_song_id]"
      assert_select "textarea#master_song_comment_comment", :name => "master_song_comment[comment]"
    end
  end
end
