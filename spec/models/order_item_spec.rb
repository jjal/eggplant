require 'spec_helper'

describe OrderItem do
  it { should validate_presence_of(:menu_item) }
  it { should validate_presence_of(:ticket) }

  describe "#to_s" do
    it "should be the name" do
      menu_item = create(:menu_item, name: "Banana Bread")
      order_item = create(:order_item, menu_item: menu_item)

      order_item.to_s.should == menu_item
    end
  end

end
