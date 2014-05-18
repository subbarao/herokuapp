class Seat < ActiveRecord::Base
  belongs_to :district
  has_many :nominations

  has_one :winner, -> { where(position: 1) }, class_name: 'Nomination'
  has_one :runner, -> { where(position: 2) }, class_name: 'Nomination'
end
