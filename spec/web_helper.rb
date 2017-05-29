def add_one_link
  visit('/links/new')
  fill_in('title', with: 'Google')
  fill_in('url', with: 'http://www.google.com')
  fill_in('tag', with: 'Search Engine')
  click_button('submit')
end

def add_second_link
  visit('/links/new')
  fill_in('title', with: 'BBC')
  fill_in('url', with: 'http://www.bbc.com')
  fill_in('tag', with: 'Bubbles')
  click_button('submit')
end

def add_link_two_tags
  visit('/links/new')
  fill_in('title', with: 'Yahoo')
  fill_in('url', with: 'http://www.yahoo.com')
  fill_in('tag', with: 'Search Engine, Search Pioneer')
  click_button('submit')
end

def sign_up(email: 'henryhobhouse@gmail.com',
            password: 'cunningpassword',
            password_confirmation: 'cunningpassword')
  visit '/sign_up'
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('submit')
end
