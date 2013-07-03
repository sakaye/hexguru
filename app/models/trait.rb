# == Schema Information
#
# Table name: traits
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trait < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :cards

  default_scope order: "traits.name ASC"
end
