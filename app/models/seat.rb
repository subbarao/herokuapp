class Seat < ActiveRecord::Base
  belongs_to :district
  belongs_to :state
  has_many :nominations
end
