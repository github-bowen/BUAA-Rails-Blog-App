class AirRoutesController < ApplicationController
  before_action :set_air_route, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /air_routes or /air_routes.json
  def index
    @air_routes = AirRoute.all
  end

  # GET /air_routes/1 or /air_routes/1.json
  def show
  end

  # GET /air_routes/new
  def new
    @air_route = AirRoute.new
  end

  # GET /air_routes/1/edit
  def edit
  end

  def get_errors
    # flash[:error] = []
    # @room_type.errors.each do |error|
    #   flash[:error] << error.full_message
    # end
    errors = []

    @air_route.errors.to_a.each do |error|
      error.gsub! /[fF]rom/, "出发地"
      error.gsub! /[tT]o/, "目的地"
      error.gsub! /[dD]eparture time/, "起飞时间"
      error.gsub! /[lL]anding time/, "着陆时间"
      error.gsub! /Airline company/, "所属航空公司"
      errors << error
    end
    errors
  end

  # POST /air_routes or /air_routes.json
  def create
    @air_route = AirRoute.new(air_route_params)

    respond_to do |format|
      if @air_route.save
        format.html { redirect_back_or_to admin_crud_url, notice: "成功新建航空路线！" }
        format.json { render :show, status: :created, location: @air_route }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @air_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /air_routes/1 or /air_routes/1.json
  def update
    respond_to do |format|
      if @air_route.update(air_route_params)
        format.html { redirect_to admin_crud_url, notice: "成功修改航空路线！" }
        format.json { render :show, status: :ok, location: @air_route }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @air_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /air_routes/1 or /air_routes/1.json
  def destroy
    tourist_route_ids = @air_route.tourist_route_ids

    if tourist_route_ids.nil? or tourist_route_ids.blank?
      @air_route.destroy

      respond_to do |format|
        format.html { redirect_back_or_to admin_crud_url, notice: "成功删除航空路线！" }
        format.json { head :no_content }
      end
    else
      flash[:error] = ['该航空路线属于 ' + tourist_route_ids.size.to_s + '条旅游路线，无法删除！' ]

      respond_to do |format|
        format.html { redirect_back_or_to admin_crud_url}
        format.json { head :no_content }
      end
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_air_route
    @air_route = AirRoute.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def air_route_params
    params.require(:air_route).permit(:from, :to, :departure_time,
                                      :landing_time, :is_direct, :airline_company_id)
  end
end
