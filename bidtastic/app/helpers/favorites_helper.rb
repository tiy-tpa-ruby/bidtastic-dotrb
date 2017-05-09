module FavoritesHelper
  def favorited(itemId)
    if Favorite.where(:item_id => itemId, :user_id => current_user.id).exists?
      return true
    else
      return false
    end
  end
end
