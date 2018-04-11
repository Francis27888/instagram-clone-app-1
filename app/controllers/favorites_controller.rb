class FavoritesController < ApplicationController
  before_action :user_is_logged_in, only: [:show]

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    user=User.find_by(id:favorite.user_id)
    redirect_to posts_url, notice: "#{user.username} liked the blog successfully"
  end

  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:post_id]).destroy
    user=User.find_by(id:favorite.user_id)
    redirect_to posts_url, notice: "#{user.username} unliked the blog successfully"
  end

end
