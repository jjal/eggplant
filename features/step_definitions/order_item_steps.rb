Given /^I add "(.*?)" and "(.*?)"$/ do |*order_items|
  order_items.each do |item|
    click_link "Add Item"
    click_link item
  end
end

Then /^I should see "(.*?)" and "(.*?)" on the ticket$/ do |*order_items|
  order_items.each do |item|
    page.should have_content(item)
  end
end