class RoomTypesController < ApplicationController
  before_action :set_room_type, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /room_types or /room_types.json
  def index
    @room_types = RoomType.all
  end

  # GET /room_types/1 or /room_types/1.json
  def show
  end

  # GET /room_types/new
  def new
    @room_type = RoomType.new
  end

  # GET /room_types/1/edit
  def edit
  end

  def get_errors
    # flash[:error] = []
    # @room_type.errors.each do |error|
    #   flash[:error] << error.full_message
    # end
    errors = []

    @room_type.errors.to_a.each do |error|
      error.gsub! /[nN]ame/, "房间类型名"
      error.gsub! /[pP]rice/, "每晚的价格"
      error.gsub! /[hH]otel/, "所属酒店"
      errors << error
    end
    errors
  end

  # POST /room_types or /room_types.json
  def create
    @room_type = RoomType.new(room_type_params)

    respond_to do |format|
      if @room_type.save
        format.html { redirect_back_or_to admin_crud_url, notice: "成功新建酒店房间类型！" }
        format.json { render :show, status: :created, location: @room_type }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_types/1 or /room_types/1.json
  def update
    respond_to do |format|
      if @room_type.update(room_type_params)
        format.html { redirect_to admin_crud_url, notice: "成功修改酒店房间类型！" }
        format.json { render :show, status: :ok, location: @room_type }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_types/1 or /room_types/1.json
  def destroy
    @room_type.destroy

    respond_to do |format|
      format.html { redirect_back_or_to admin_crud_url, notice: "成功删除酒店房间类型！" }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room_type
    @room_type = RoomType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_type_params
    params.require(:room_type).permit(:name, :has_window, :price, :hotel_id)
  end
end
