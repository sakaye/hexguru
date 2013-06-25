class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def index
    @cards = Card.first
  end
  
  def show
    @card = Card.find(params[:id])
  end
end
