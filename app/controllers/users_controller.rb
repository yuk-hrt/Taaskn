class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lists = @user.lists.order("created_at DESC")
  end

end
