module UsersHelper
  def setLatAndLon(lat, lon)
    @player = Player.find(params[:id])
    latDecLength = lat
    latDecLength.to_s.split('.').last.size
    lonDecLength = lon
    lonDecLength.to_s.split('.').last.size

    if ((latDecLength == 4) && (lonDecLength == 4))
      self.lat = Lat
      self.lon = Lon
    end
  end

  
end
