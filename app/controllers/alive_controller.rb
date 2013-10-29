class AliveController < ApplicationController
  def index
  	@players = Player.where('is_dead = "f"')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end
end