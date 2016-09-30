class SightingsController < ApplicationController
  before_action :find_sighting, only: [:show, :edit, :update, :destroy, :filter]
  before_action :authenticate_user!, except: [:index, :show]

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
    @sighting.user = current_user
    respond_to do |format|
      if @sighting.save
        flash[:success] = "Animal sighting added!"
        format.html { redirect_to root_path, notice: "Thanks for answering" }
        format.js { render :create_success }
      else
        render 'new'
      end
    end
  end

  def filter
    sighting_ids = params[:data_value]
    @sightinga = Sighting.where("id in (?)",
    sighting_ids)
    respond_to do |format|
      format.js { render :filter_success }
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:animal, :description, :submited_by, :raw_address, :latitude, :longitude, :address)
  end

  def sighting
    @sighting ||= Sighting.find(params[:id])
  end

  def find_sighting
      @sighting = Sighting.find params[:id]
  end
end
