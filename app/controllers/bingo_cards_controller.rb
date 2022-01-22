class BingoCardsController < ApplicationController
  before_action :set_bingo_card, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token


  # GET /bingo_cards or /bingo_cards.json
  def index
    @bingo_cards = BingoCard.all
  end

  # GET /bingo_cards/1 or /bingo_cards/1.json
  def show
    @bingo_card = BingoCard.find(params[:id])
  end

  # GET /bingo_cards/new
  def new
    @bingo_card = BingoCard.new
    @bingo_card.pick_numbers
    respond_to do |format|
      format.html { render partial: 'bingo_cards/bingo_card', locals: { bingo_card: @bingo_card } }
      format.json { render json: @bingo_card }
    end
  end

  # GET /bingo_cards/1/edit
  def edit; end

  # POST /bingo_cards or /bingo_cards.json
  def create
    @bingo_card = BingoCard.new(bingo_card_params)
    @bingo_card.pick_numbers
    @bingo_game = BingoGame.find(params[:bingo_card][:bingo_game_id]) if params[:bingo_card][:bingo_game_id]
    respond_to do |format|
      if @bingo_card.save
        format.html { render partial: 'bingo_cards/bingo_card', locals: { bingo_card: @bingo_card, bingo_game: @bingo_game } }
        format.json { render json: @bingo_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bingo_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bingo_cards/1 or /bingo_cards/1.json
  def update
    respond_to do |format|
      if @bingo_card.update(bingo_card_params)
        format.html { redirect_to bingo_card_url(@bingo_card), notice: "Bingo card was successfully updated." }
        format.json { render :show, status: :ok, location: @bingo_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bingo_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bingo_cards/1 or /bingo_cards/1.json
  def destroy
    @bingo_card.destroy

    respond_to do |format|
      format.html { redirect_to bingo_cards_url, notice: "Bingo card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy_all
    BingoCard.destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bingo_card
      @bingo_card = BingoCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bingo_card_params
      params.require(:bingo_card).permit(:winner, :bingo_game_id)
    end
end
