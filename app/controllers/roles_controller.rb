class RolesController < ApplicationController
  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params.require(:role).permit(:description))

    if @role.save
      redirect_to role_url(id: @role.id), notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end
end