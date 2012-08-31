require 'spec_helper'

describe "fan_bases/edit.html.erb" do
  before(:each) do
    @fan_base = assign(:fan_base, stub_model(FanBase,
      :name => "MyString"
    ))
  end

  it "renders the edit fan_base form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fan_bases_path(@fan_base), :method => "post" do
      assert_select "input#fan_base_name", :name => "fan_base[name]"
    end
  end
end
