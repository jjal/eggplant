require 'spec_helper'

describe "paychecks/show" do
  before(:each) do
    @paycheck = assign(:paycheck, stub_model(Paycheck))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
