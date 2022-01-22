class HomeController < ApplicationController

  def index
    @bingo_games = BingoGame.all
  end
end
