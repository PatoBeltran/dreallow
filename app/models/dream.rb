# == Schema Information
#
# Table name: dreams
#
#  id         :integer          not null, primary key
#  content    :text(255)
#  user_id    :integer
#  shared     :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class Dream < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user
  has_many :meanings

  validates :content, presence: true

  acts_as_votable

  default_scope order: 'dreams.created_at DESC'
end
