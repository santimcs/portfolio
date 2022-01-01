class CoverBuysController < ApplicationController
  before_action :set_cover_buy, only: [:show, :edit, :update, :destroy]

  # GET /cover_buys
  # GET /cover_buys.json
  def index
    @cover_buys = CoverBuy.all
  end

  # GET /cover_buys/1
  # GET /cover_buys/1.json
  def show
  end

  # GET /cover_buys/new
  def new
    @cover_buy = CoverBuy.new
  end

  # GET /cover_buys/1/edit
  def edit
  end

  # POST /cover_buys
  # POST /cover_buys.json
  def create
    @cover_buy = CoverBuy.new(cover_buy_params)

    respond_to do |format|
      if @cover_buy.save
        format.html { redirect_to @cover_buy, notice: 'Cover buy was successfully created.' }
        format.json { render json: @cover_buy, status: :created, location: @cover_buy }
      else
        format.html { render action: "new" }
        format.json { render json: @cover_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cover_buys/1
  # PUT /cover_buys/1.json
  def update
    respond_to do |format|
      if @cover_buy.update(cover_buy_params)
        format.html { redirect_to @cover_buy, notice: 'Cover buy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cover_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cover_buys/1
  # DELETE /cover_buys/1.json
  def destroy
    @cover_buy.destroy
    respond_to do |format|
      format.html { redirect_to cover_buys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover_buy
      @cover_buy = CoverBuy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_buy_params
      params.require(:cover_buy).permit(:chart, :date, :days, :fee, :net, :percent, :price, :profit, :sequence, :vat, :yearly, :short_sell_id)
    end  
end
