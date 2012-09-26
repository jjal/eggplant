require 'spec_helper'

describe "paychecks/edit" do
  before(:each) do
    @paycheck = assign(:paycheck, stub_model(Paycheck))
  end

  it "renders the edit paycheck form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paychecks_path(@paycheck), :method => "post" do
    end
  end
end
