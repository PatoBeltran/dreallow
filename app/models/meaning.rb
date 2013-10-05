# == Schema Information
#
# Table name: meanings
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  dream_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Meaning < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :dream
  
  validates :content, presence: true

  default_scope order: 'meanings.created_at DESC'
end
