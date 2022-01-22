class BingoGamesController < ApplicationController
  before_action :set_bingo_game, only: %i[ show edit update destroy draw_number reset_numbers ]
  skip_before_action :verify_authenticity_token


  # GET /bingo_games or /bingo_games.json
  def index
    @bingo_games = BingoGame.all
  end

  # GET /bingo_games/1 or /bingo_games/1.json
  def show
    @bingo_cards = @bingo_game.bingo_cards
    @bingo_numbers = @bingo_game.bingo_numbers
    @possible_numbers = @bingo_game.possible_numbers
  end

  # GET /bingo_games/new
  def new
    @bingo_game = BingoGame.new
  end

  # GET /bingo_games/1/edit
  def edit
  end

  # POST /bingo_games or /bingo_games.json
  def create
    @bingo_game = BingoGame.new(bingo_game_params)

    respond_to do |format|
      if @bingo_game.save
        format.html { redirect_to bingo_game_url(@bingo_game), notice: "Bingo game was successfully created." }
        format.json { render :show, status: :created, location: @bingo_game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bingo_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bingo_games/1 or /bingo_games/1.json
  def update
    respond_to do |format|
      if @bingo_game.update(bingo_game_params)
        format.html { redirect_to bingo_game_url(@bingo_game), notice: "Bingo game was successfully updated." }
        format.json { render :show, status: :ok, location: @bingo_game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bingo_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bingo_games/1 or /bingo_games/1.json
  def destroy
    @bingo_game.destroy

    respond_to do |format|
      format.html { redirect_to bingo_games_url, notice: "Bingo game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /bingo_games/1/draw_number
  def draw_number
    number = @bingo_game.draw_number
    response = number ? number.display : "No more numbers available"
    render plain: response
  end

  def reset_numbers
    @bingo_game.reset_numbers
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bingo_game
      @bingo_game = BingoGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bingo_game_params
      params.require(:bingo_game).permit(:name)
    end
end
