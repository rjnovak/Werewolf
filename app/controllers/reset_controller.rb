class ResetController < ApplicationController
  def show
  	Player.destroy_all
  	Game.destroy_all
  	@users = User.all
  	@game = Game.new(start: Time.now, interval: params[:ninterval])
  	@game.save
    userCount = User.count()
    totalWolfCount = userCount/6
    if totalWolfCount == 0
      totalWolfCount = 1
    end
    totalTownCount = userCount - totalWolfCount
    currentWolfCount = 0
    currentTownCount = 0
    role = 0
    @users.each do |p|
      if (currentWolfCount < totalWolfCount) && (currentTownCount < totalTownCount)
        role = rand(1)
        if role == 0
          currentTownCount = currentTownCount + 1
        elsif role == 1
          currentWolfCount = currentWolfCount + 1
        end
      elsif currentWolfCount == totalWolfCount
        role = 0
        currentTownCount = currentTownCount + 1
      elsif currentTownCount == totalTownCount
        role = 1
        currentWolfCount = currentWolfCount + 1
      end
    	player = Player.new(role: role, user_id: p.id, game_id: @game.id)
    	player.save
    end
    respond_to do |format|
    #  format.html # index.html.erb
      format.json { render json: @game }
    end
  end
end