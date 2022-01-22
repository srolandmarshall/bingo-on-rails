require "application_system_test_case"

class BingoGamesTest < ApplicationSystemTestCase
  setup do
    @bingo_game = bingo_games(:one)
  end

  test "visiting the index" do
    visit bingo_games_url
    assert_selector "h1", text: "Bingo games"
  end

  test "should create bingo game" do
    visit bingo_games_url
    click_on "New bingo game"

    fill_in "Name", with: @bingo_game.name
    click_on "Create Bingo game"

    assert_text "Bingo game was successfully created"
    click_on "Back"
  end

  test "should update Bingo game" do
    visit bingo_game_url(@bingo_game)
    click_on "Edit this bingo game", match: :first

    fill_in "Name", with: @bingo_game.name
    click_on "Update Bingo game"

    assert_text "Bingo game was successfully updated"
    click_on "Back"
  end

  test "should destroy Bingo game" do
    visit bingo_game_url(@bingo_game)
    click_on "Destroy this bingo game", match: :first

    assert_text "Bingo game was successfully destroyed"
  end
end
