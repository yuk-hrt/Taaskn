class CardsController < ApplicationController

  before_action :set_list, only: [:new, :create, :destroy]
  before_action :set_card, only: [:sort, :done]
  

  def new
    @card = Card.new
  end

  def create
    @card = @list.cards.new(card_params)
    if @card.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def destroy
    @card = @list.cards.find(params[:id])
    if @card.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path
    end
  end

  def sort
    @card.update(card_params)
  end

  def done
    @card.update(done: true)
  end

  private
  def card_params
    params.require(:card).permit(:memo, :row_order_position)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_card
    @card = Card.find(params[:card_id])
  end

end
