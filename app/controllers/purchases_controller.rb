class PurchasesController < ApplicationController
  def show
  	@purchase = Purchase.find(params[:id])
  end

  def new
    @items = Item.all
  	@purchase = Purchase.new
  end

    def create
  	@purchase = Purchase.new(purchase_params)
    @purchase.codes.upcase!
    @purchase.total = @purchase.checkout(@purchase.codes)
  	  if @purchase.save
  	  	redirect_to purchase_path(@purchase)
  	  else
  	  	render 'new'
  	  end
  end

  private

  def purchase_params
  	params.require(:purchase).permit(:codes)
  end
end
