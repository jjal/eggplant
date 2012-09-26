require 'spec_helper'

describe "pay_rates/index" do
  before(:each) do
    assign(:pay_rates, [
      stub_model(PayRate),
      stub_model(PayRate)
    ])
  end

  it "renders a list of pay_rates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
