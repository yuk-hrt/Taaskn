class LikesController < ApplicationController

  before_action :set_list

  def create
    like = current_user.likes.new(list_id: @list.id)
    like.save
  end

  def destroy
    like = current_user.likes.find_by(list_id: @list.id)
    like.destroy
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

end
