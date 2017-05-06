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
    add_new_link
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
    expect(page).to have_content('Tag:')
  end

  scenario '#User can add tags that are accessible on the links page' do
    add_new_link
    expect(LinkTag.last.tag.tag_name).to eq 'Search Engine'
  end
end

# As a user
# So that I can find similar URL's faster
# I want to be able to filter my favourites by their tags
