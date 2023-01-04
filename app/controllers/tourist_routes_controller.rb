class TouristRoutesController < ApplicationController
  before_action :set_tourist_route, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /tourist_routes or /tourist_routes.json
  def index
    @tourist_routes = TouristRoute.all
  end

  # GET /tourist_routes/1 or /tourist_routes/1.json
  def show
  end

  # GET /tourist_routes/new
  def new
    @tourist_route = TouristRoute.new
  end

  # GET /tourist_routes/1/edit
  def edit
  end

  def get_errors
    # flash[:error] = []
    # @room_type.errors.each do |error|
    #   flash[:error] << error.full_message
    # end
    errors = []

    @tourist_route.errors.to_a.each do |error|
      error.gsub! /[oO]rigin/, "出发地"
      error.gsub! /[dD]estination/, "目的地"
      error.gsub! /[tT]otal days/, "总天数"
      error.gsub! /[cC]ost/, "总开销"
      error.gsub! /[aA]gency/, "旅行社"
      error.gsub! /[uU]ser/, "用户"
      error.gsub! /[nN]ame/, "旅游路线名"
      errors << error
    end
    errors
  end

  # POST /tourist_routes or /tourist_routes.json
  def create
    @tourist_route = TouristRoute.new(tourist_route_params)
    unless params[:tourist_route][:hotel_ids].nil?
      @tourist_route.hotels = params[:tourist_route][:hotel_ids].map { |id| Hotel.find(id.to_i) }
    end
    unless params[:tourist_route][:air_route_ids].nil?
      @tourist_route.air_routes = params[:tourist_route][:air_route_ids].map { |id|
        AirRoute.find(id.to_i)
      }
    end
    # create_or_delete_tourist_routes_hotels(@tourist_route, params[:tourist_route][:hotels])

    respond_to do |format|
      if @tourist_route.save
        format.html { redirect_back_or_to tourist_routes_path, notice: "成功新建旅游路线！" }
        format.json { render :show, status: :created, location: @tourist_route }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to tourist_routes_path }
        format.json { render json: @tourist_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tourist_routes/1 or /tourist_routes/1.json
  def update
    # create_or_delete_tourist_routes_hotels(@tourist_route, params[:tourist_route][:hotels])
    @tourist_route.hotels = params[:tourist_route][:hotel_ids].map { |id| Hotel.find(id.to_i) }
    @tourist_route.air_routes = params[:tourist_route][:air_route_ids].map { |id| AirRoute.find(id.to_i) }
    respond_to do |format|
      if @tourist_route.update(tourist_route_params)
        format.html { redirect_to tourist_routes_path, notice: "成功修改旅游线路！" }
        format.json { render :show, status: :ok, location: @tourist_route }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to tourist_routes_path }
        format.json { render json: @tourist_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourist_routes/1 or /tourist_routes/1.json
  def destroy
    @tourist_route = TouristRoute.find(params[:id])
    blog = Blog.find_by_tourist_route_id(@tourist_route.id)

    if blog.nil?
      @tourist_route.destroy

      respond_to do |format|
        format.html { redirect_back_or_to tourist_routes_path, notice: "成功删除旅游路线！" }
        format.json { head :no_content }
      end

    else
      flash[:error] = ["该旅游路线与标题为《" + blog.title + "》的博客绑定，请先删除该博客后再删除！"]

      respond_to do |format|
        format.html { redirect_back_or_to tourist_routes_path }
        format.json { head :no_content }
      end

    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tourist_route
    @tourist_route = TouristRoute.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tourist_route_params
    params.require(:tourist_route).permit(:origin, :destination, :total_days, :cost, :user_id, :name,
                                          :agency, hotel_ids: [], air_route_ids: [])
  end
end
