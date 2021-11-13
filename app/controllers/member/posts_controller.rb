class Member::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    #投稿者とログインユーザをひも付ける
    if @post.save

      redirect_to post_path(@post.id), notice: "You have created post successfully."
    # else
    # @member = current_member
    # @posts = post.all
    # render :index
  #renderはredirect_toと異なりアクションを経由せず、そのままビューを出力するので、ビューで使う変数は、renderの前にそのアクション`で定義しないといけない。 ここでは@posts=post.allアクションを定義しておく必要
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :article, :genre, :link, :status)

  end

end
