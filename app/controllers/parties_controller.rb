class PartiesController < ApplicationController
  def show
    @party = Party.find params[:id]
  end

  def new
    @party = Party.new
  end
  def create
    @user = current_user

    @party = Party.new(party_parameters)
    @party.user = @user

    if @party.save!
      redirect_to party_path(@party)
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def party_parameters
    params.require(:party).permit(:title, :description, :photo)
  end
end
