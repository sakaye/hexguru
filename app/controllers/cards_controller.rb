class CardsController < ApplicationController
  def new
  end

  def index
    @cards = Card.paginate(page: params[:page])
  end

  def show
    @card = Card.find(params[:id])
  end
end
