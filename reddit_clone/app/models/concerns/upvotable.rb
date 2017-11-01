module Upvotable

  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :upvotable
  end

  def vote_count
    count = 0
    votes.each do |vote|
      count += 1 if vote.upvote_type == 'up'
      count -= 1 if vote.upvote_type == 'down'
    end
    count
  end

  def upvote(user)
    votes << Vote.create(upvote_type: 'up', user_id: user.id)
  end

  def downvote(user)
    votes << Vote.create(upvote_type: 'down', user_id: user.id)
  end

end
