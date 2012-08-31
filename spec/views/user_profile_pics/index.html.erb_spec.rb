require 'spec_helper'


describe "user_profile_pics/index" do
  before(:each) do
    assign(:user_profile_pics, [

      stub_model(UserProfilePic,

        :user_id => "User",

        :photo => ""


      ),


      stub_model(UserProfilePic,

        :user_id => "User",

        :photo => ""


      )


    ])
  end

  it "renders a list of user_profile_pics" do
    render


    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2



    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2


  end
end
