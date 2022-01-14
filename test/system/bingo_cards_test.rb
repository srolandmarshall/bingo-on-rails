require "application_system_test_case"

class BingoCardsTest < ApplicationSystemTestCase
  setup do
    @bingo_card = bingo_cards(:one)
  end

  test "visiting the index" do
    visit bingo_cards_url
    assert_selector "h1", text: "Bingo cards"
  end

  test "should create bingo card" do
    visit bingo_cards_url
    click_on "New bingo card"

    fill_in "Number", with: @bingo_card.number_id
    check "Winner" if @bingo_card.winner
    click_on "Create Bingo card"

    assert_text "Bingo card was successfully created"
    click_on "Back"
  end

  test "should update Bingo card" do
    visit bingo_card_url(@bingo_card)
    click_on "Edit this bingo card", match: :first

    fill_in "Number", with: @bingo_card.number_id
    check "Winner" if @bingo_card.winner
    click_on "Update Bingo card"

    assert_text "Bingo card was successfully updated"
    click_on "Back"
  end

  test "should destroy Bingo card" do
    visit bingo_card_url(@bingo_card)
    click_on "Destroy this bingo card", match: :first

    assert_text "Bingo card was successfully destroyed"
  end
end
