class Member::FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    # js.erbファイルに渡す変数
    favorite = @post.favorites.new(member_id: current_member.id)
    favorite.save
    # 非同期通信のためredirect_to削除
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find_by(member_id: current_member.id)
    favorite.destroy
    # 非同期通信のためredirect_to削除
  end
end
