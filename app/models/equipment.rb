# == Schema Information
#
# Table name: equipment
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  game_text  :text
#  type_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Equipment < ActiveRecord::Base
  attr_accessible :game_text, :name, :type_id

  has_and_belongs_to_many :cards
end
