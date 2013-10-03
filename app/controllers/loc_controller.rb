class LocController < ApplicationController
  def setloc
    @player = Player.find(params[:playerid])
    respond_to do |format|
      if (@player.update_attributes(:lat => params[:nlat]) && @player.update_attributes(:lon => params[:nlon]))
          format.html { redirect_to @player, notice: 'Player was successfully updated.' }
          format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def getnear
    lowerlat = params[:nlat] - 5
    upperlat = params[:nlat] + 5
    lowerlon = params[:nlon] - 5
    upperlon = params[:nlon] + 5
    @players = Player.where('lowerlat <= lat').where('upperlat >= lat').where('lowerlon <= lon').where('upperlon >= lon')

    respond_to do |format|
      format.json { render json: @players }
    end
  end
end