# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cost        :string(255)
#  game_type   :boolean
#  game_text   :text
#  lore_text   :text
#  restriction :boolean
#  image       :string(255)
#  attack      :integer
#  defense     :integer
#  color_id    :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rarity_id   :integer          default(1)
#  faction_id  :integer          default(1)
#

class Card < ActiveRecord::Base
  attr_accessible :name, :cost, :type_ids, :color_id, :rarity_id, :game_type, :attack,
                  :defense, :game_text, :lore_text, :restriction, :faction_id, :image,
                  :collection_ids, :trait_ids, :keyword_ids


  belongs_to :color
  belongs_to :rarity
  belongs_to :faction
  has_and_belongs_to_many :types
  has_and_belongs_to_many :traits
  has_and_belongs_to_many :collections
  has_and_belongs_to_many :equipment
  has_and_belongs_to_many :keywords
  has_many :comments


  def self.search(search)
    if search
      self.includes(:color, :types, :rarity, :traits).where('name LIKE ?', "%#{search}%")
    else
      self.includes(:color, :types, :rarity, :traits).find(:all, :order => 'name')
    end
  end

  def self.filter(params)
    filters = {}
    type_ids = {}
    filters[:color_id] = params[:color_id] if params[:color_id]
    type_ids[:id] = params[:type_id]
    filters[:types] = type_ids if params[:type_id]
    filters[:rarity_id] = params[:rarity_id] if params[:rarity_id]
    filters[:faction_id] = params[:faction_id] if params[:faction_id]

    if filters.any?
      self.includes(:color, :types, :rarity, :traits).where(filters)
    else
      self.includes(:color, :types, :rarity, :traits).find(:all, :order => 'name')
    end
  end
end








