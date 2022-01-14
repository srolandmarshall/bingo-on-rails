class BingoNumbersController < ApplicationController
  before_action :set_bingo_number, only: %i[ show edit update destroy ]

  # GET /bingo_numbers or /bingo_numbers.json
  def index
    @bingo_numbers = BingoNumber.all
  end

  # GET /bingo_numbers/1 or /bingo_numbers/1.json
  def show
  end

  # GET /bingo_numbers/new
  def new
    @bingo_number = BingoNumber.new
  end

  # GET /bingo_numbers/1/edit
  def edit
  end

  # POST /bingo_numbers or /bingo_numbers.json
  def create
    @bingo_number = BingoNumber.new(bingo_number_params)

    respond_to do |format|
      if @bingo_number.save
        format.html { redirect_to bingo_number_url(@bingo_number), notice: "Bingo number was successfully created." }
        format.json { render :show, status: :created, location: @bingo_number }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bingo_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bingo_numbers/1 or /bingo_numbers/1.json
  def update
    respond_to do |format|
      if @bingo_number.update(bingo_number_params)
        format.html { redirect_to bingo_number_url(@bingo_number), notice: "Bingo number was successfully updated." }
        format.json { render :show, status: :ok, location: @bingo_number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bingo_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bingo_numbers/1 or /bingo_numbers/1.json
  def destroy
    @bingo_number.destroy

    respond_to do |format|
      format.html { redirect_to bingo_numbers_url, notice: "Bingo number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bingo_number
      @bingo_number = BingoNumber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bingo_number_params
      params.require(:bingo_number).permit(:bingo_card_id, :letter, :number)
    end
end
