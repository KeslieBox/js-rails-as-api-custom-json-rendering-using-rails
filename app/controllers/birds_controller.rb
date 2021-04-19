class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    binding.pry
    render json: bird.slice(:id, :name, :species)
  end
end