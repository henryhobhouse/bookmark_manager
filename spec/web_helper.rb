def add_new_link
  visit('/links/new')
  fill_in('title', with: 'Google')
  fill_in('url', with: 'http://www.google.com')
  fill_in('tag', with: 'Search Engine')
  click_button('submit')
end
