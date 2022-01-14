require "test_helper"

class BingoNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bingo_number = bingo_numbers(:one)
  end

  test "should get index" do
    get bingo_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_bingo_number_url
    assert_response :success
  end

  test "should create bingo_number" do
    assert_difference("BingoNumber.count") do
      post bingo_numbers_url, params: { bingo_number: { bingo_card_id: @bingo_number.bingo_card_id, letter: @bingo_number.letter, number: @bingo_number.number } }
    end

    assert_redirected_to bingo_number_url(BingoNumber.last)
  end

  test "should show bingo_number" do
    get bingo_number_url(@bingo_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_bingo_number_url(@bingo_number)
    assert_response :success
  end

  test "should update bingo_number" do
    patch bingo_number_url(@bingo_number), params: { bingo_number: { bingo_card_id: @bingo_number.bingo_card_id, letter: @bingo_number.letter, number: @bingo_number.number } }
    assert_redirected_to bingo_number_url(@bingo_number)
  end

  test "should destroy bingo_number" do
    assert_difference("BingoNumber.count", -1) do
      delete bingo_number_url(@bingo_number)
    end

    assert_redirected_to bingo_numbers_url
  end
end
