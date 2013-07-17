# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  card_id    :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :card_id, :content

  belongs_to :card
  belongs_to :user

  default_scope order: "comments.created_at DESC"

  validates :user_id, presence: true
  validates :card_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end
