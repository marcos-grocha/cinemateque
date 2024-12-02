class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = MovieTheater.new(params.require(:movie_theater).permit(:name, :city))

    if @actor.save
      redirect_to actor_url(id: @actor.id), notice: t('.success')
    else

    end
  end

  def show
    @actor = Actor.find(params[:id])
  end

end
