require 'spec_helper'

describe "leaves/index" do
  before(:each) do
    assign(:leaves, [
      stub_model(Leafe),
      stub_model(Leafe)
    ])
  end

  it "renders a list of leaves" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
