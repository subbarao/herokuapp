class Seat < ActiveRecord::Base
  belongs_to :district
  belongs_to :state
  has_many :nominations, -> { order("votes desc") }
  scope :mlas, -> { where(type: 'Mla') }
  scope :mps, -> { where(type: 'Mp') }

  has_one :winner, -> { where(position: 1) }, class_name: 'Nomination'
  has_one :runner, -> { where(position: 2) }, class_name: 'Nomination'

  def total_votes
    nominations.sum(:votes)
  end
end
