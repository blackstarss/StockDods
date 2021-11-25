class Member::HashtagsController < ApplicationController
  
  def hashtag
    @member = current_member
    @tag = Hashtag.find_by(name: params[:name])
    @posts = @tag.posts.page(params[:page]).reverse_order
    @genres = Genre.all
  end
end
