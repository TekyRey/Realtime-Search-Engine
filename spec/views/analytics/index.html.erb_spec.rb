require 'capybara/rspec'
require 'rails_helper'

RSpec.feature "Search Rankings", type: :feature do
  scenario "user visits search rankings page" do
    visit analytics_index_path

    expect(page).to have_content("Ranking of searches by phrases")
    expect(page).to have_link("Back to search page", href: root_path)
    expect(page).to have_content("Unique Users:")
    expect(page).to have_content("All Users' Search Phrase Occurrence")
    expect(page).to have_content("Current User's Search Phrase Occurrence")
    expect(page).to have_content("Word Frequency Analysis")
  end
end