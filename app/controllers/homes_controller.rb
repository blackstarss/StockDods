class HomesController < ApplicationController
  def top
    @posts = Post.where(status: false)
    # ステータスがtrueの記事は表示しない
    @genres = Genre.all
  end
end
