class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /hotels or /hotels.json
  def index
    @hotels = Hotel.all
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

  def get_errors
    # flash[:error] = []
    # @room_type.errors.each do |error|
    #   flash[:error] << error.full_message
    # end
    errors = []

    @hotel.errors.to_a.each do |error|
      error.gsub! /[nN]ame/, "酒店名"
      error.gsub! /[tT]ypes/, "酒店类型"
      error.gsub! /[rR]ate/, "酒店星级"
      error.gsub! /[lL]ocation/, "酒店位置"
      errors << error
    end
    errors
  end

  # POST /hotels or /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_back_or_to admin_crud_url, notice: "成功新建酒店！" }
        format.json { render :show, status: :created, location: @hotel }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to admin_crud_url, notice: "成功修改酒店！" }
        format.json { render :show, status: :ok, location: @hotel }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel = Hotel.find(params[:id])
    tourist_route_ids = @hotel.tourist_route_ids

    if tourist_route_ids.nil? or tourist_route_ids.blank?
      @hotel.destroy

      respond_to do |format|
        format.html { redirect_back_or_to admin_crud_url, notice: "成功删除酒店！" }
        format.json { head :no_content }
      end
    else
      flash[:error] = ['该酒店属于 ' + tourist_route_ids.size.to_s + ' 条旅游路线，无法删除！']

      respond_to do |format|
        format.html { redirect_back_or_to admin_crud_url }
        format.json { head :no_content }
      end
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hotel_params
    params.require(:hotel).permit(:name, :types, :rate, :location, :tourist_routes)
  end
end
