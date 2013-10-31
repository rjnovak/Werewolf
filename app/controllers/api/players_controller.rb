class Api::PlayersController < Api::BaseController
  def index
  	respond_with(Player.all)
  end

  def update
  	# responds with 200 if success, 422 if not
  	@player.update_attributes(params[:player])
  	respond_with(player)
  end

  def show
    respond_with(Player.for(current_user))
  end
end