class HomesController < ApplicationController
  def top
    @posts = Post.where(status: false)
    @genres = Genre.all


  end
end
