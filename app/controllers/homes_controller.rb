class HomesController < ApplicationController
  
  def top
    @posts = Post.where(status: false).page(params[:page]).reverse_order
    # ステータスがtrueの記事は表示しない
    @genres = Genre.all
  end
end
