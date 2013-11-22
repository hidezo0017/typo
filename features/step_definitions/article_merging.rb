#coding: utf-8
Given(/^the following users exist:$/) do |users_table|
  users_table.hashes.each do |user|
    User.create!({
                      login: user["login"],
                      password: user["password"],
                      email: user["email"],
                      name: user["name"],
                      profile_id: user["profile_id"]
                  })
  end
end
Given(/^the following articles exist:$/) do |articles_table|
  articles_table.hashes.each do |article|
    user = User.find_by_name(article["author"])
    Article.create!({
                     user_id: user.id,
                     title: article["title"],
                     author: article["author"],
                     body: article["body"],
                     published: article["published"]
                 })
  end
end

Given(/^I am logged into the admin panel as "(.*?)" with a password "(.*?)"$/) do |login, password|
  visit '/accounts/login'
  fill_in 'user_login', with: login
  fill_in 'user_password', with: password
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given(/^I visit the the edit page for "(.*?)"$/) do |title|
  visit '/admin'
  click_link 'All Article'
  page.should have_content(title)
  click_link title
end

Given(/^I attempt to merge with "(.*?)"$/) do |second_title|
  pending # express the regexp above with the code you wish you had
end

Given(/^I revisit the the edit page for "(.*?)"$/) do |first_title|
  pending # express the regexp above with the code you wish you had
end