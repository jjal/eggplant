Given /^the staff member "(.*?)"$/ do |name|
  create(:user, name: name)
end

Given /^I am logged in as "(.*?)"$/ do |name|
  user = User.find_by_name(name) || create(:user, name: name)
  # user = User.where(name: name).first
  # sign in as user
end