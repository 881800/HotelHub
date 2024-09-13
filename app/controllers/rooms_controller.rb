class RoomsController < ApplicationController
  before_action :set_hotel, only:  [:create]
  before_action :set_room, only: [:show, :edit, :update, :destroy]


  def index
    @rooms = Room.all
    @hotel = Hotel.find(params[:hotel_id])
    @hotels = Hotel.all
  end
  

  def room_management
    @rooms = Room.includes(:hotel).all
  end

  def room_params
    params.require(:room).permit(:check_in, :check_out, :rooms, :adults, :children, :min_price, :max_price, :type, amenities: [])
  end
  

  def new
    @room = @hotel.rooms.build
  end

  def create
    @room = @hotel.rooms.build(room_params)
    if @room.save
      redirect_to hotel_room_path(@hotel, @room), notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to hotel_room_path(@hotel, @room), notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to hotel_rooms_path(@hotel), notice: 'Room was successfully deleted.'
  end

  private

  def set_hotel(hotel_id)
    @hotel = Hotel.find(hotel_id)
  end

  def set_room (room_id)
    @room = @hotel.rooms.find(room_id)
  end

  def room_params
    params.require(:room).permit(:room_type, :availability, :price, :description)
  end
end
