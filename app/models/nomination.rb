class Nomination < ActiveRecord::Base
  belongs_to :party
  belongs_to :seat
  scope :with_position, ->(position) { where(position: position) }

  def lost_by
    winner.votes - votes
  end

  def winner
    seat.nominations.with_position(1).first
  end
end
