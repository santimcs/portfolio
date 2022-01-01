class ShortSellsController < ApplicationController
  before_action :set_short_sell, only: [:show, :edit, :update, :destroy]

  # GET /short_sells
  # GET /short_sells.json
  def index
    @short_sells = ShortSell.all
  end

  # GET /short_sells/1
  # GET /short_sells/1.json
  def show
  end

  # GET /short_sells/new
  def new
    @short_sell = ShortSell.new
  end

  # GET /short_sells/1/edit
  def edit
  end

  # POST /short_sells
  # POST /short_sells.json
  def create
    @short_sell = ShortSell.new(short_sell_params)

    respond_to do |format|
      if @short_sell.save
        format.html { redirect_to @short_sell, notice: 'Short sell was successfully created.' }
        format.json { render json: @short_sell, status: :created, location: @short_sell }
      else
        format.html { render action: "new" }
        format.json { render json: @short_sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /short_sells/1
  # PUT /short_sells/1.json
  def update
    respond_to do |format|
      if @short_sell.update(short_sell_params)
        format.html { redirect_to @short_sell, notice: 'Short sell was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @short_sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_sells/1
  # DELETE /short_sells/1.json
  def destroy
    @short_sell.destroy
    respond_to do |format|
      format.html { redirect_to short_sells_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_sell
      @short_sell = ShortSell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_sell_params
      params.require(:short_sell).permit(:chart, :date, :fee, :kind, :net, :price, :qty, :status, :stock_id, :vat)
    end  
end
