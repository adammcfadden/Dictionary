require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word path', {:type => :feature}) do
  it('load an index page, click to add a new word, direct to word input page, allow user to input a new word and definition. Display that word on the index page') do
    visit('/')
    click_link('Click here to add a new word')
    fill_in('word', :with => 'Jaguar')
    fill_in('definition', :with => 'King of the jungle')
    click_button('submit_forms')
    expect(page).to have_content('Jaguar')
  end
end
