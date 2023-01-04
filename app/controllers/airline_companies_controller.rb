class AirlineCompaniesController < ApplicationController
  before_action :set_airline_company, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /airline_companies or /airline_companies.json
  def index
    @airline_companies = AirlineCompany.all
  end

  # GET /airline_companies/1 or /airline_companies/1.json
  def show
  end

  # GET /airline_companies/new
  def new
    @airline_company = AirlineCompany.new
  end

  # GET /airline_companies/1/edit
  def edit
  end

  def get_errors
    # flash[:error] = []
    # @room_type.errors.each do |error|
    #   flash[:error] << error.full_message
    # end
    errors = []

    @airline_company.errors.to_a.each do |error|
      error.gsub! /[nN]ame/, "航空公司名"
      errors << error
    end
    errors
  end

  # POST /airline_companies or /airline_companies.json
  def create
    @airline_company = AirlineCompany.new(airline_company_params)

    respond_to do |format|
      if @airline_company.save
        format.html { redirect_back_or_to admin_crud_url, notice: "成功新建航空公司！" }
        format.json { render :show, status: :created, location: @airline_company }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @airline_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airline_companies/1 or /airline_companies/1.json
  def update
    respond_to do |format|
      if @airline_company.update(airline_company_params)
        format.html { redirect_to admin_crud_url, notice: "成功修改航空公司！" }
        format.json { render :show, status: :ok, location: @airline_company }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to admin_crud_url }
        format.json { render json: @airline_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airline_companies/1 or /airline_companies/1.json
  def destroy
    @airline_company = AirlineCompany.find(params[:id])
    can_destroy = true
    count = 0
    @airline_company.air_route_ids.each do |air_route_id|
      if !AirRoute.find(air_route_id).tourist_route_ids.nil?
        can_destroy = false
        count = count + 1
      end
    end

    if can_destroy
      @airline_company.destroy

      respond_to do |format|
        format.html { redirect_back_or_to admin_crud_url, notice: "成功删除航空公司！" }
        format.json { head :no_content }
      end
    else
      flash[:error] = ['该航空公司下有 ' + count.to_s + ' 条航空路线属于已创建的旅游路线，删除失败！']

      respond_to do |format|
        format.html { redirect_back_or_to admin_crud_url }
        format.json { head :no_content }
      end
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_airline_company
    @airline_company = AirlineCompany.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def airline_company_params
    params.require(:airline_company).permit(:name)
  end
end
