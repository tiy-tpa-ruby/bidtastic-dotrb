class FavoritesController < ApplicationController
  def create
  current_user.favorites.create(:item_id => params[:itemId])
end

def destroy
  favorite = Favorite.find_by(:item_id => params[:itemId], :user_id =>
  current_user.id)
  favorite.destroy
end

end
