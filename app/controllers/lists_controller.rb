class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :user_id).merge(user_id: current_user.id)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
