class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(params.require(:actor).permit(:name, :date_of_birth, :nationality))

    if @actor.save
      redirect_to actor_url(id: @actor.id), notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @actor = Actor.find(params[:id])
  end
end
