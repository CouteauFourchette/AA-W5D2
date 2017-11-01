# == Schema Information
#
# Table name: votes
#
#  id             :integer          not null, primary key
#  upvote_type    :string
#  upvotable_type :string
#  upvotable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Vote < ApplicationRecord
  validates :upvote_type, inclusion: { in: ['up', 'down'] }
  belongs_to :upvotable, polymorphic: true

  belongs_to :user
end
