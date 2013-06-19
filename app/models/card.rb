class Card < ActiveRecord::Base
  attr_accessible :name, :cost, :card_type, :color, :rarity, :game_type, :attack,
                  :defense, :trait, :game_text, :lore_text, :restriction, :set_number,
                  :faction, :related_equipment, :image



end
