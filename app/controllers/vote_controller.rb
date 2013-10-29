class VoteController < ApplicationController
  def setvote
    @player = Player.find(params[:voterid])
    respond_to do |format|
      if @player.update_attributes(:votes_for => params[:votedid])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
    respond_to do |format|
      format.json { render json: @player }
    end
  end

  def kill
    @players = Player.all
    mostVotes = 0
    mostVoted = 0
    @players.each do |p|
      voted = Player.find(p.votes_for)
      voted.votes = voted.votes + 1
      if voted.votes > mostVotes
        mostVotes = voted.votes
        mostVoted = voted.id
      end
    end
    @player = Player.find(mostVoted)
    @player.update_attributes(:is_dead => 1)
    @players.each do |p|
      p.votes = 0
    end
    wolfCount = Player.count(:conditions => "role = 1")
    townCount = Player.count(:conditions => "role = 0")
    if wolfCount == townCount
      @users = User.all
      @users.each do |p|
        if p.player.role == 1
          p.score = p.score + 100
          Player.destroy_all
          Game.destroy_all
        end
      end
    elsif wolfCount == 0
      @users = User.all
      @users.each do |p|
        if p.player.role == 0
          p.score = p.score + 100
          Player.destroy_all
          Game.destroy_all
        end
      end
    else
      @users = User.all
      @users.each do |p|
        if p.player.role == 0
          #townspeople gain 20 points per day survived
          p.score = p.score + 20
        end
      end
    end
    respond_to do |format|
      format.json { render json: @player }
    end
  end
end