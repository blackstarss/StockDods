class Member::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if current_member.update(member_params)
      redirect_to member_path(@member), notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :biography, :image)
  end
end
