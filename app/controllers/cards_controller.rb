class CardsController < ApplicationController
  before_filter :admin_user, only: [:new, :create, :edit, :update]
  before_filter :find_card, only: [:show, :edit, :update]

  def index
    @cards = Card.search(params[:search])
    @types = Type.all
    @colors = Color.all
    @rarities = Rarity.all
    @factions = Faction.all
  end

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
  
  def show
    @comment = current_user.comments.build if signed_in?
    @comments = @card.comments
  end

  def edit
  end

  def update
    if @card.update_attributes(params[:card])
      flash[:notice] = "Card updated"
      redirect_to @card
    else
      render 'edit'
    end
  end

  def filter
    @cards = Card.filter(params)
  end

  protected

    def find_card
      @card = Card.find(params[:id])
    end

  private

    def admin_user
      redirect_to signin_path, alert: "You must be signed in to do that." unless current_user && current_user.admin?
    end
end
