class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]

  # GET /hotels or /hotels.json
  def index
    @hotels = Hotel.all

    if params[:room_type].present? || params[:price_min].present? || params[:price_max].present? ||
       params[:beds].present? || params[:available_from].present? || params[:available_to].present? || params[:guests].present?
      
      @hotels = @hotels.joins(:rooms).where(rooms: room_search_params).distinct
    end
  end

  


  # GET /hotels/1 or /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels or /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel was successfully created." }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel.destroy!

    respond_to do |format|
      format.html { redirect_to hotels_url, notice: "Hotel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :address, :description)
    end

    def room_search_params
      conditions = {}

      # Filtrar por tipo de habitación
      conditions[:room_type] = params[:room_type] if params[:room_type].present?

      # Filtrar por rango de precios
      if params[:price_min].present? && params[:price_max].present?
        conditions[:price] = params[:price_min]..params[:price_max]
      elsif params[:price_min].present?
        conditions[:price] = params[:price_min]..Float::INFINITY
      elsif params[:price_max].present?
        conditions[:price] = 0..params[:price_max]
      end

      # Filtrar por cantidad de camas
      conditions[:beds] = params[:beds] if params[:beds].present?

      # Filtrar por disponibilidad
      if params[:available_from].present? && params[:available_to].present?
        conditions[:available_from] = params[:available_from]
        conditions[:available_to] = params[:available_to]
      end

      # Filtrar por número de personas
      conditions[:guests] = params[:guests] if params[:guests].present?

      conditions
    end
end
