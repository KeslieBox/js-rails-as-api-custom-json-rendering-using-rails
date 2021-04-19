class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # below syntax produces array of bird objects and each object will only have 
    # the id, name and species values, leaving out everything else:
    render json: birds, only: [:id, :name, :species]
    # or the reverse would be: 
    # render json: birds, except: [:created_at, :updated_at]

    # The only and except keywords are actually parameters 
    # of the to_json method, obscured by that magic. This renders same as above:
    #  render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # error handling for if the bird is nil
    if bird
      # works for our single bird hash
      render json: bird.slice(:id, :name, :species)
      #  or: render json: { id: bird.id, name: bird.name, species: bird.species }
      # jsonified into this JSON js object notation: "{\"id\":1,\"name\":\"Black-Capped Chickadee\",\"species\":\"Poecile Atricapillus\"}"
    else
      render json: { message: "Bird not found" }    
    end
end