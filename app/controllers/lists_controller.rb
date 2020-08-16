class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, ]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.includes(:cards).order('created_at DESC')
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to user_path(current_user.id)
    else 
      render :new
    end
  end

  def show
  end

  def edit
    if @list.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @list.update(list_params)
      redirect_to user_path(current_user.id)
    else 
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to user_path(current_user.id)
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
