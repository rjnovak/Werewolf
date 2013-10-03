class KillController < ApplicationController
  def show
    @player = Player.find(params[:victimid])
    respond_to do |format|
      if @player.update_attributes(:is_dead => 1)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end
end