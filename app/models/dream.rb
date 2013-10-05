# == Schema Information
#
# Table name: dreams
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  annonymous :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Dream < ActiveRecord::Base
  belongs_to :user
end
