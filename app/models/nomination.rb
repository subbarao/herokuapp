class Nomination < ActiveRecord::Base
  belongs_to :party
  belongs_to :seat
  scope :with_position, ->(position) { where(position: position) }
  scope :mlas, -> { joins(:seat).where("seats.type = ?", 'Mla') }
  scope :mps, -> { joins(:seat).where("seats.type = ?", 'Mp') }

  def percentage
    (votes * 100.0)/ seat.total_votes
  end

  def lost_by
    winner.votes - votes
  end

  def won?
    winner.id == self.id
  end

  def lost?
    !won?
  end

  def winner
    seat.nominations.with_position(1).first
  end
end
