class ListsController < ApplicationController

  def index
    @lists = Lists.all
  end

  def new
    # @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private
  def list_params
  end

end
