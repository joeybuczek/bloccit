class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    
    if favorite.save
      flash[:notice] = "Favorited!"
      go_back_to_post
    else
      flash[:error] = "There was a problem favoriting this post."
      go_back_to_post
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.where(post: @post).first
    authorize favorite
    
    if favorite.destroy
      flash[:notice] = "Unfavorited... but that's okay, you have the right to change your mind!"
      go_back_to_post
    else
      flash[:error] = "There was a problem unfavoriting this post."
      go_back_to_post
    end
  end
  
  def go_back_to_post
    redirect_to [@post.topic, @post]
  end
  
end
