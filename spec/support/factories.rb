FactoryGirl.define do

  factory :menu_item do
    name "Banana Bread"
  end

  factory :order_item do
    menu_item
    ticket
  end


  factory :ticket do
    table_number 22
    name          "Melina"
  end

  factory :user do
    name "Yong"
  end

end