class OpinionsController < ApplicationController
  before_action :set_hotel

  def index
    @opinions = @hotel.opinions
  end

  def create
    @opinion = @hotel.opinions.build(opinion_params)
    @opinion.user = current_user
    if @opinion.save
      redirect_to hotel_path(@hotel), notice: 'Opinion was successfully created.'
    else
      render 'hotels/show'
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def opinion_params
    params.require(:opinion).permit(:room_id, :rating, :comment)
  end
end
