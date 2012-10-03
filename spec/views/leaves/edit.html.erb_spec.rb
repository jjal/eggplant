require 'spec_helper'

describe "leaves/edit" do
  before(:each) do
    @leafe = assign(:leafe, stub_model(Leafe))
  end

  it "renders the edit leafe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leaves_path(@leafe), :method => "post" do
    end
  end
end
