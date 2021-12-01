class Member::RelationshipsController < ApplicationController
  # ——————フォロー機能を作成・保存・削除する————————————
  def create
    current_member.follow(params[:member_id])
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:member_id])
    redirect_to request.referer
  end

  # ————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    member = Member.find(params[:member_id])
    @members = member.followings.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def followers
    member = Member.find(params[:member_id])
    @members = member.followers.page(params[:page]).reverse_order
    @genres = Genre.all
  end
end
