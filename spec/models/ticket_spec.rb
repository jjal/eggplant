require 'spec_helper'

describe Ticket do
  describe "#to_s" do
    it "should be the table number" do
      ticket = create(:ticket, table_number: 20)

      ticket.to_s.should == "Table 20"
    end
  end
end
