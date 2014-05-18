class Nomination < ActiveRecord::Base
  belongs_to :party
  belongs_to :seat
  scope :with_position, ->(position) { where(position: position) }

  def lost_by
    seat.winner.votes - votes
  end
end
