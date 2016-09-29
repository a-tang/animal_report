class SightingsController < ApplicationController

  def show
    @sighting = Sighting.find(params[:id])
  end

  def index
   @sightings = Sighting.order('created_at DESC')
 end

 def new
   @sighting = Sighting.new
   @sightings = Sighting.order('created_at DESC')
 end

 def destroy
   sighting.delete
   redirect_to new_sighting_path
 end

 def create
   @sighting = Sighting.new(sighting_params)
   if @sighting.save
     flash[:success] = "Animal sighting added!"
     redirect_to new_sighting_path
   else
     render 'new'
   end
 end

 private

 def sighting_params
   params.require(:sighting).permit(:animal, :description, :submited_by, :raw_address, :latitude, :longitude, :address)
 end

 def sighting
   @sighting ||= Sighting.find(params[:id])
 end

end
