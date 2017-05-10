class BidsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])

    unless logged_in?
      redirect_to item_path(@item), notice: "Must be logged in to make a bid"
      return
    end

    @bid = @item.bids.create(bid_params)
    @bid.created_by = current_user

    if @bid.save
      redirect_to item_path(@item), notice: "Bid accepted!"
    else
      Rails.logger.debug ["Failed to validate", @bid.errors]
      redirect_to item_path(@item), notice: "Unable to accept this bid"
    end
  end

private
  def bid_params
    params.require(:bid).permit(:bid_amount)
  end
end
