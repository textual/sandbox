class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml
  def index
    
    @locations = Location.find(:all, :origin => session[:geo_location], :order => 'distance')
    
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([session[:geo_location].lat, session[:geo_location].lng],5)
    
    @locations.each do |location|
      @map.overlay_init(GMarker.new([location.lat,location.lng],:title => location.name, :info_window => location.name + "<br/>" + location.address))
    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])
    
    @map = GMap.new("map_div_small")
    @map.control_init(:small_zoom => true)
    @map.center_zoom_init([@location.lat,@location.lng],10)
    
 
    @map.overlay_init(GMarker.new([@location.lat,@location.lng],:title => @location.name, :max_width => 150, :info_window => @location.address + "<br/><a href='http://maps.google.com/maps?daddr=" + @location.address + "' target='blank'>get directions</a>"))
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end
  
  def search
    @area = params[:area]
    @geo=Geokit::Geocoders::MultiGeocoder.geocode (@area)
    if @geo.success
      session[:geo_location] = @geo
      redirect_to :action => "index"
    else
      flash[:notice] = "location not found"
    end
    
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])
    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
