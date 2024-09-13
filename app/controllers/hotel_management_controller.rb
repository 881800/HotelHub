class HotelManagementController < ApplicationController

  def index
    @hotels = Hotel.all
  end

end