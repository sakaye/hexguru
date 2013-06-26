class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(params[:card])
    if @card.save
      flash[:notice] = "Card created"
      redirect_to @card
    else
      render 'new'
    end
  end

  def index
    @cards = Card.first
  end
  
  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      flash[:notice] = "Card updated"
      redirect_to @card
    else
      render 'edit'
    end
  end
end
