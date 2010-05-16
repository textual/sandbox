class ZipController < ApplicationController
  def index
    @map = GMap.new("map_div")

    @map.control_init(:large_map => true, :map_type => true)

    @map.center_zoom_init([33, -87],6)
 
end

def find

  zcta = Alabama.find(:all,:conditions => ["name = ?", @params[:zip]])
  #zcta = Alabama.first

  if zcta.nil?
    @message = "#{@params[:zip]} not in Alabama"
    puts 'zip code fail'
  else

    poly = zcta.the_geom[0]
    envelope = poly.envelope

  
    @id = zcta.id
    @map = Variable.new("map")

    @polygon = GPolygon.from_georuby(poly,"#000000",0,0.0,"#ff0000",0.6)

    @center = GLatLng.from_georuby(envelope.center)
    @zoom = @map.get_bounds_zoom_level(GLatLngBounds.from_georuby(envelope))

  end
end

def georss
  zcta = Alabama.find(params[:id])

  @id = zcta.id
  @polygon = zcta.the_geom[0]

  @envelope = @polygon.envelope
  @name = zcta.name

end

end
