require "application_system_test_case"

class BingoNumbersTest < ApplicationSystemTestCase
  setup do
    @bingo_number = bingo_numbers(:one)
  end

  test "visiting the index" do
    visit bingo_numbers_url
    assert_selector "h1", text: "Bingo numbers"
  end

  test "should create bingo number" do
    visit bingo_numbers_url
    click_on "New bingo number"

    fill_in "Bingo card", with: @bingo_number.bingo_card_id
    fill_in "Letter", with: @bingo_number.letter
    fill_in "Number", with: @bingo_number.number
    click_on "Create Bingo number"

    assert_text "Bingo number was successfully created"
    click_on "Back"
  end

  test "should update Bingo number" do
    visit bingo_number_url(@bingo_number)
    click_on "Edit this bingo number", match: :first

    fill_in "Bingo card", with: @bingo_number.bingo_card_id
    fill_in "Letter", with: @bingo_number.letter
    fill_in "Number", with: @bingo_number.number
    click_on "Update Bingo number"

    assert_text "Bingo number was successfully updated"
    click_on "Back"
  end

  test "should destroy Bingo number" do
    visit bingo_number_url(@bingo_number)
    click_on "Destroy this bingo number", match: :first

    assert_text "Bingo number was successfully destroyed"
  end
end
