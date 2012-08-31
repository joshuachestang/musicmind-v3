require 'spec_helper'


describe "user_profile_pics/new" do
  before(:each) do
    assign(:user_profile_pic, stub_model(UserProfilePic,

      :user_id => "MyString",

      :photo => ""

    ).as_new_record)
  end

  it "renders new user_profile_pic form" do
    render


    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_profile_pics_path, :method => "post" do

      assert_select "input#user_profile_pic_user_id", :name => "user_profile_pic[user_id]"

      assert_select "input#user_profile_pic_photo", :name => "user_profile_pic[photo]"

    end

  end
end
