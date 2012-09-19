Given /^I start a new ticket$/ do
  visit tickets_path
  click_link "New Ticket"
end

Given /^I fill in the ticket details$/ do
  fill_in "Table number", with: "1"
  fill_in "Name", with: "Melina"
end

When /^I save the ticket$/ do
  click_button "Save"
end

Then /^I should see the ticket on the tickets page$/ do
  within('#tickets') do
    page.should have_content('Table 1')
  end
end

Given /^there is a ticket for table (\d+)$/ do |table_number|
  create(:ticket, table_number: table_number)
end

Given /^I open the ticket for table (\d+)$/ do |table_number|
  visit tickets_path
  click_link "Table #{table_number}"
end