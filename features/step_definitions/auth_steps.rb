Given(/^the home page$/) do
  visit '/'
end

When(/^we click to "(.*?)" button$/) do |button|
  click_button(button)
end

Then(/^we should see registration form$/) do
  expect(page).to have_content('Register')
end

Given(/^the registration page$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^we fill registration form$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^click to "(.*?)" button$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then(/^we should redirect to files list page$/) do
    pending # express the regexp above with the code you wish you had
end

Given(/^register new user$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^we fill registration form with registered user email$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^we should see error message$/) do
    pending # express the regexp above with the code you wish you had
end
