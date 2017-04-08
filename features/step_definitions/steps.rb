When(/^I go to Redfin$/) do
  visit "https://www.redfin.com/"
  # fill_in 'searchInputBox', with: '90630'
end

Then(/^I will click the Sign In button$/) do
    all(:xpath, '//*[@id="userMenu"]/div[1]/div/div/div/a[1]/span')[0].click
end

Then(/^Enter Username$/) do
    fill_in 'emailInput', with: 'sushil.mayer@hotmail.com'
end

Then(/^Enter Password$/) do
  fill_in 'passwordInput', with: 'Redfin1!'
end

Then(/^Enter Invalid Password$/) do
  fill_in 'passwordInput', with: 'wrongPassword'
end

Then(/^Click Sign In$/) do
  click_button 'Sign In'
end

Then(/^Verify User is Logged In$/) do
  expect(page).to have_css("#userMenu", text: "Sushil")
end

Then(/^Verify we logged in$/) do
  expect(page).to have_xpath('//*[@id="search-box-input"]')
end

Then(/^Enter Filter$/) do
  fill_in 'search-box-input', with: '4322 Pearl ct., cypress, CA 90630', :match => :prefer_exact
end

Then(/^Make Selection$/) do
  click_link('4322 Pearl Ct')
end

Then(/^Verify Title$/) do
  expect(page).to have_title '4322 Pearl Ct, Cypress, CA 90630 | Redfin'
end

Then(/^Verify Login Error$/) do
  find(:xpath, '//*[@id="login_error"]')
end