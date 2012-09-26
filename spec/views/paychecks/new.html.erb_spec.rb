require 'spec_helper'

describe "paychecks/new" do
  before(:each) do
    assign(:paycheck, stub_model(Paycheck).as_new_record)
  end

  it "renders new paycheck form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paychecks_path, :method => "post" do
    end
  end
end
