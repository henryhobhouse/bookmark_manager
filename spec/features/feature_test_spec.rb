# As a user
# So that I can find my favourite URL's faster
# I want to be able to see a list of my favourite URLs
feature 'As a user I would like to see a list of my favourite URLs' do
  scenario 'Website is able to load links from the database and display them' do
    Link.create(url: 'http://test.com', title: 'Test Link')
    visit '/links'
    expect(page).to have_content('Test Link')
  end
end

# As a time-pressed user
# So that I can quickly find web sites I recently bookmarked
# I would like to see links in descending chronological order

# As a user
# So that I can add new URL's to my favourites
# I want to be able to add a new URL to my favourites

feature 'As a user I would like to add links to my favourite URLs' do
  scenario '#Web app has form for adding a URL to favourites' do
    visit('/links/new')
    expect(page).to have_field('title')
    expect(page).to have_field('url')
    expect(page).to have_button('submit')
  end

  scenario '#Web app adds new URL to list from completed form' do
    add_one_link
    visit('/links')
    expect(page).to have_content('Google')
  end
end

# As a user
# So that I can see what type of URL's it is
# I want to be able to tag the URL with a category label

feature 'To find links faster I want to apply label tags' do
  scenario '#User can add label tags to new links' do
    visit '/links/new'
    expect(page).to have_content('Tag/s:')
  end

  scenario '#User can add tags that are accessible on the links page' do
    add_one_link
    expect(Link.last.tags.map(&:tag_name)).to include('search engine')
  end

  scenario '#User can add multiple tags to each link' do
    add_link_two_tags
    expect(Link.last.tags.map(&:tag_name)).to include('search engine',
                                                      'search pioneer')
  end
end

# As a user
# So that I can find similar URL's faster
# I want to be able to filter my favourites by their tags

feature 'To find links faster I wish to filter by tag' do
  scenario '#expect to see a list of tags URLS on the links page' do
    add_one_link
    add_second_link
    visit '/links'
    expect(page).to have_link('Bubbles', href: '/tag/bubbles')
  end

  scenario '#clicking a tag will only show a list of related links' do
    add_one_link
    add_second_link
    visit '/tag/bubbles'
    expect(page).to have_link('BBC', href: 'http://www.bbc.com')
    expect(page).to_not have_link('Google', href: 'http://www.google.com')
  end
end

feature 'Allows a user to sign in securely to view their personal links' do
  scenario '#Can visit a signup page that accepts a user name and password' do
    visit '/'
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('submit')
  end

  scenario '#Will redirect user to links page after submission' do
    sign_up
    page.has_xpath('//links')
  end

  scenario '#Checks the links page shows a welcome message as first login' do
    sign_up
    expect(page).to have_content('Welcome to favourites')
    visit '/links'
    expect(page).to_not have_content('Welcome to favourites')
  end

  scenario '#Checks that the users email address is shown on welcome message' do
    sign_up
    expect(page).to have_content('to favourites henryhobhouse@gmail.com')
  end

  scenario '#Checks the user count increases by 1' do
    sign_up
    expect(User.total).to eq 1
  end
end
