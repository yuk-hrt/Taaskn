class CardsController < ApplicationController
  

  def new
    @list = List.find(params[:list_id])
    @card = Card.new
  end

  def create
    @list = List.find(params[:list_id])
    @card = @list.cards.new(card_params)
    if @card.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @card = @list.cards.find(params[:id])
    if @card.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def sort
    @card = Card.find(params[:card_id])
    @card.update(card_params)
    redirect_to root_path
  end

  private
  def card_params
    params.require(:card).permit(:memo, :row_order_position)
  end

end
