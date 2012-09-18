Given /^the staff member "(.*?)"$/ do |name|
  create(:user, name: name)
end

Given /^I am logged in as "(.*?)"$/ do |name|
  # user = User.where(name: name).first
  # sign in as user
end