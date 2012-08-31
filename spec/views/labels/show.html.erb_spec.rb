require 'spec_helper'

describe "labels/show" do
  before(:each) do
    @label = assign(:label, stub_model(Label,
      :fan_base_id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
  end
end
