require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the definition path', {:type => :feature}) do
  it('creates a new word, clicks the word in the dictionary list, clicks to add a definition, enters new definition, clicks submit, finds that definition on word page') do
    visit('/')
    click_button('add_word')
    fill_in('word', :with => 'Jaguar')
    fill_in('definition', :with => 'King of the jungle')
    click_button('submit_forms')
    click_link('word1')
    click_button('add_definition')
    fill_in('add_definition', :with => 'A relative of the panther')
    click_button('submit_definition')
    expect(page).to have_content('A relative of the panther')
  end
end
