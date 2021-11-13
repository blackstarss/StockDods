class Admin::HomesController < ApplicationController
  def top
    @members= Member.all
    @genres = Genre.all
  end
end