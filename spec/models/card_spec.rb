# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cost        :integer
#  game_type   :boolean
#  game_text   :text
#  lore_text   :text
#  image       :string(255)
#  attack      :integer
#  defense     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color_id    :integer
#  rarity_id   :integer
#  faction_id  :integer
#  restriction :boolean
#

require 'spec_helper'

describe Card do
  
end
