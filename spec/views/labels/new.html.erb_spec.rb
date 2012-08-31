require 'spec_helper'

describe "labels/new" do
  before(:each) do
    assign(:label, stub_model(Label,
      :fan_base_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new label form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => labels_path, :method => "post" do
      assert_select "input#label_fan_base_id", :name => "label[fan_base_id]"
      assert_select "input#label_name", :name => "label[name]"
    end
  end
end
