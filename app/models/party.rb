class Party < ActiveRecord::Base
  has_many :nominations
  has_many :seats, through: :nominations
end
