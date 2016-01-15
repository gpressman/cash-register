class ItemsController < ApplicationController
  def show
  	@item = Item.find(params[:id])
  end

  def index
  	@items = Item.all
  end

  def new
    @items = Item.all
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
    @item.formatted_code = @item.format_code(@item.product_code)
  	  if @item.save
  	  	redirect_to item_path(@item)
  	  else
  	  	render 'new'
  	  end
  end

  private
  def item_params
  	params.require(:item).permit(:name, :product_code, :price)
  end
end
