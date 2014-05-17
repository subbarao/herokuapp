class HomeController < ApplicationController
  def index
    @seats = Seat.all(include: :winners)
  end
end
