require 'spec_helper'

describe "pay_rates/new" do
  before(:each) do
    assign(:pay_rate, stub_model(PayRate).as_new_record)
  end

  it "renders new pay_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pay_rates_path, :method => "post" do
    end
  end
end
