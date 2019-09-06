class AddressesController < ApplicationController
  before_action :setAddress, only: [:show, :edit, :update, :destroy]
  before_action :setLocation

  def index
    @addresses = @location.addresses.all
  end

  def show
  end

  def new
    @address = @location.addresses.new
    render :template => "addresses/_form"
  end

  def create
    @address = @location.addresses.new(addParams)

    if @address.save
      redirect_to [@location, @address]
    else 
      render :template => "addresses/_form"
    end
  end


  def edit
    render :template => "addresses/_form"
  end

  def update
    if @address.update(addParams)
      redirect_to [@location, @address]
    else
      render :template => "addresses/_form"
    end
  end

  def destroy
    @address.destroy
    redirect_to location_addresses_path
  end

  private

    def setAddress
      @address = Address.find(params[:id])
    end

    def setLocation
      @location = Location.find(params[:location_id])
    end

    def addParams
      params.require(:address).permit(:street, :city, :state, :zip)
    end
end
