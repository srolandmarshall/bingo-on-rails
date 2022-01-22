require "test_helper"

class BingoGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bingo_game = bingo_games(:one)
  end

  test "should get index" do
    get bingo_games_url
    assert_response :success
  end

  test "should get new" do
    get new_bingo_game_url
    assert_response :success
  end

  test "should create bingo_game" do
    assert_difference("BingoGame.count") do
      post bingo_games_url, params: { bingo_game: { name: @bingo_game.name } }
    end

    assert_redirected_to bingo_game_url(BingoGame.last)
  end

  test "should show bingo_game" do
    get bingo_game_url(@bingo_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_bingo_game_url(@bingo_game)
    assert_response :success
  end

  test "should update bingo_game" do
    patch bingo_game_url(@bingo_game), params: { bingo_game: { name: @bingo_game.name } }
    assert_redirected_to bingo_game_url(@bingo_game)
  end

  test "should destroy bingo_game" do
    assert_difference("BingoGame.count", -1) do
      delete bingo_game_url(@bingo_game)
    end

    assert_redirected_to bingo_games_url
  end
end
