require "test_helper"

class BingoCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bingo_card = bingo_cards(:one)
  end

  test "should get index" do
    get bingo_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_bingo_card_url
    assert_response :success
  end

  test "should create bingo_card" do
    assert_difference("BingoCard.count") do
      post bingo_cards_url, params: { bingo_card: { number_id: @bingo_card.number_id, winner: @bingo_card.winner } }
    end

    assert_redirected_to bingo_card_url(BingoCard.last)
  end

  test "should show bingo_card" do
    get bingo_card_url(@bingo_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_bingo_card_url(@bingo_card)
    assert_response :success
  end

  test "should update bingo_card" do
    patch bingo_card_url(@bingo_card), params: { bingo_card: { number_id: @bingo_card.number_id, winner: @bingo_card.winner } }
    assert_redirected_to bingo_card_url(@bingo_card)
  end

  test "should destroy bingo_card" do
    assert_difference("BingoCard.count", -1) do
      delete bingo_card_url(@bingo_card)
    end

    assert_redirected_to bingo_cards_url
  end
end
