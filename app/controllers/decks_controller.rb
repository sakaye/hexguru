class DecksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @deck = Deck.new
    @cards = Card.search(params[:search])
    @types = Type.all
    @colors = Color.all
    @rarities = Rarity.all
    @factions = Faction.all
  end

  def create
  end

  def update
  end

  def destroy
  end
end
