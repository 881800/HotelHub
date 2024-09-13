class ReservationsController < ApplicationController
  before_action :set_user
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
 



  def index
    @reservations = current_user.reservations
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
    @hotel = @reservation.room.hotel
    @payment = @reservation.payment
    @reservation.payments.build

  end

  def new
    @reservation = @user.reservations.build
  end

  def create
    @reservation = @user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to user_reservation_path(@user, @reservation), notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to user_reservation_path(@user, @reservation), notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to user_reservations_path(@user), notice: 'Reservation was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_reservation
    @reservation = @user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:room_id, :check_in_date, :check_out_date, :status)
  end
end
