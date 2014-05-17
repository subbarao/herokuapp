class Seat < ActiveRecord::Base
  belongs_to :district
  has_many :nominations
  has_many :winners, class_name: 'Nomination', :order => 'votes DESC', limit: 2

  def winner
    winners[0]
  end

  def runner
    winners[1]
  end
end
