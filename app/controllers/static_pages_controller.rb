class StaticPagesController < ApplicationController

  def index
    @lastest_cards = Card.find(:all, :limit => 5, :order => 'created_at desc') 
  end
  
end
