require 'application_system_test_case'

class GamesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit games_url
  #
  #   assert_selector "h1", text: "Game"
  # end
  test 'Going to /new gives us a new random grid to play with' do
    visit new_url
    assert test: 'New game'
    assert_selector 'li', count: 10
  end

  test 'saying Hej and get a response' do
    visit new_url
    fill_in 'word', with: 'Hej'
    click_on 'Play'

    assert_text "Sorry but \'Hej\' can\'t be built out of"
  end
  test 'saying A and get a positive response' do
    visit new_url
    fill_in 'word', with: 'A'
    click_on 'Play'
    take_screenshot
    assert_text 'Congratulations! A is a valid English word!'
  end
end
