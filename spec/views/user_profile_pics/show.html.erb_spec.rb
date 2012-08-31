require 'spec_helper'


describe "user_profile_pics/show" do
  before(:each) do
    @user_profile_pic = assign(:user_profile_pic, stub_model(UserProfilePic,

      :user_id => "User",

      :photo => ""


    ))

  end

  it "renders attributes in <p>" do
    render


    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)



    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)


  end
end
