class ResetController < ApplicationController
  def show
  	Player.destroy_all
  	Game.destroy_all
  	@users = User.all
  	@game = Game.new(start: Time.now, interval: params[:ninterval])
  	@game.save
    @users.each do |p|
    	player = Player.new(role: 0, user_id: 1, game_id: @games.id)
    	player.save
    end
    respond_to do |format|
    #  format.html # index.html.erb
      format.json { render json: @game }
    end
  end
end