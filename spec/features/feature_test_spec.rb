# As a user
# So that I can find my favourite URL's faster
# I want to be able to see a list of my favourite URLs
feature 'As a user I would like to see a list of my favourite URLs' do
  scenario 'Website is able to load links from the database and display them' do
    Link.create(url: 'http://test.com', title: 'Test Link')
    visit '/link'
    expect(page).to have_content('Test Link')
  end
end


# As a time-pressed user
# So that I can quickly find web sites I recently bookmarked
# I would like to see links in descending chronological order

# As a user
# So that I can add new URL's to my favourites
# I want to be able to add a new URL to my favourites

# As a user
# So that I can see what type of URL's it is
# I want to be able to tag the URL with a category label

# As a user
# So that I can find similar URL's faster
# I want to be able to filter my favourites by their tags
