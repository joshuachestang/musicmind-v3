require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :fan_base_id => 1,
      :event_name => "MyString",
      :event_address => "MyText",
      :event_city => "MyString",
      :event_state => "MyString",
      :zip_code => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_fan_base_id", :name => "event[fan_base_id]"
      assert_select "input#event_event_name", :name => "event[event_name]"
      assert_select "textarea#event_event_address", :name => "event[event_address]"
      assert_select "input#event_event_city", :name => "event[event_city]"
      assert_select "input#event_event_state", :name => "event[event_state]"
      assert_select "input#event_zip_code", :name => "event[zip_code]"
    end
  end
end
