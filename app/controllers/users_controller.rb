class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lists = @user.lists.includes(:cards).order('created_at DESC')
  end

end
