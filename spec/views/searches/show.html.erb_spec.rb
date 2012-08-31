require 'spec_helper'

describe "searches/show" do
  before(:each) do
    @search = assign(:search, stub_model(Search))
  end

  it "renders attributes in <p>" do
    render
  end
end
