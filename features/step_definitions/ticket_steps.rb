Given /^I start a new ticket$/ do
  visit tickets_path
  click_link "New Ticket"
end