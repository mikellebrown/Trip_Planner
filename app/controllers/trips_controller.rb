class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update]

  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.new(trips_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def update
    if @trip.update(account_params)
      redirect_to trips_path
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @trip.destroy 
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date)
    end

    def set_trip
      @trip = current_users.trip.find(params[:id])
    end
end

