def path_to(page_name)
  case page_name
  when /the home page/
    root_path
  when /the list of articles/
    articles_path
  when /New Article/
    new_article_path
  else
    articles path
  end
end

Given(/^I have articles titled (.+)$/) do |titles|
  titles.split(", ").each do |title|
    Article.create!(:title => title)
  end
end

When(/^I go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Given(/^I have no articles$/) do
  Article.delete_all
end

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I follow "(.*?)"$/) do |page_name|
  visit path_to(page_name)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, :with => value
end

When(/^I press "(.*?)"$/) do |button_name|
  click_button(button_name)
end

Then(/^I should have (\d+) article$/) do |count|
  Article.count.should == count.to_i
end
