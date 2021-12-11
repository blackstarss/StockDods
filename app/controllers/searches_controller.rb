class SearchesController < ApplicationController

  def search
    @member = current_member
    @genres = Genre.all
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'post'
      @records = Post.search_for(@content, @method).where(status: false).page(params[:page]).reverse_order
    else
      @records = Member.search_for(@content, @method)
    end
  end
end
