require 'spec_helper'

describe "pay_rates/edit" do
  before(:each) do
    @pay_rate = assign(:pay_rate, stub_model(PayRate))
  end

  it "renders the edit pay_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pay_rates_path(@pay_rate), :method => "post" do
    end
  end
end
