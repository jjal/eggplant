require 'spec_helper'

describe "paychecks/index" do
  before(:each) do
    assign(:paychecks, [
      stub_model(Paycheck),
      stub_model(Paycheck)
    ])
  end

  it "renders a list of paychecks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
