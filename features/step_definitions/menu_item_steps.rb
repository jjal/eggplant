Given /^"(.*?)" and "(.*?)" are on the menu$/ do |*items|
  items.each do |item|
    create(:menu_item, name: item)
  end
end