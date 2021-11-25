class Admin::HomesController < ApplicationController
  
  before_action :authenticate_admin!

  def top
    @members = Member.all.page(params[:page]).reverse_order
  end
end
