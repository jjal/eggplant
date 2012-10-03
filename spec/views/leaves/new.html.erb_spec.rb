require 'spec_helper'

describe "leaves/new" do
  before(:each) do
    assign(:leafe, stub_model(Leafe).as_new_record)
  end

  it "renders new leafe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leaves_path, :method => "post" do
    end
  end
end
