class Party < ActiveRecord::Base
  has_many :nominations
  has_many :seats, through: :nominations

  def mlas_positions
    seats.mlas.joins(:nominations).select("DISTINCT(nominations.position)").map(&:position).sort
  end
  def mps_positions
    seats.mps.joins(:nominations).select("DISTINCT(nominations.position)").map(&:position).sort
  end

  def abbr
    name.split(" ").map {|r| r[0] }.join.upcase
  end
end
