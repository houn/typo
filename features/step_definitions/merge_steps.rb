Given /the following users exist/ do |users_table|
	users_table.hashes.each do |user|
		User.create!(user)
	end
end

Given /the following articles exist/ do |articles_table|
	articles_table.hashes.each do |article|
		Article.create!(article)
	end
end

And /^I am logged in as "(.*?)" with password "(.*?)"$/ do |arg1, arg2|
  visit '/accounts/login'
  fill_in 'user_login', :with => arg1
  fill_in 'user_password', :with => arg2
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

When /^I follow "(.*?)" on article "(.*?)"$/ do |arg1, arg2|
  visit "/admin/content/#{arg1.downcase}/#{arg2}"
  if page.respond_to? :should
    page.should have_content('New Article')
  else
    assert page.has_content?('New Article')
  end
end

