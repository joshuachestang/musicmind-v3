require 'spec_helper'

describe "fan_bases/show.html.erb" do
  before(:each) do
    @fan_base = assign(:fan_base, stub_model(FanBase,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
