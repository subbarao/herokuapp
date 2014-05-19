class PartiesController < ApplicationController
  caches_action :index, :show

  def show
    @party = Party.find(params[:id])
  end

  def index
  end
end
