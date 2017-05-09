class BidsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @bid = @item.bids.create(bid_params)
    @bid.created_by = current_user
    @bid.save
  end

private
  def bid_params
    params.require(:bid).permit(:bid_amount)
  end
end
