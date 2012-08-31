require 'spec_helper'

describe "fan_bases/index.html.erb" do
  before(:each) do
    assign(:fan_bases, [
      stub_model(FanBase,
        :name => "Name"
      ),
      stub_model(FanBase,
        :name => "Name"
      )
    ])
  end

  it "renders a list of fan_bases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
