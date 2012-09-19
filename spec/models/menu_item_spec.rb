require 'spec_helper'

describe MenuItem do
  it { should validate_presence_of(:name) }

  describe "#to_s" do
    it "should be the name" do
      menu_item = create(:menu_item, name: "Banana Bread")

      menu_item.to_s.should == "Banana Bread"
    end
  end
end
