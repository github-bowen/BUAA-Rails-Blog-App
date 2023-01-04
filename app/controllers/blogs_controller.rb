class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  after_action :log_view_times, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def log_view_times
    @blog.view_times += 1
    @blog.save
  end

  def correct_user
    @blog = current_user.blogs.find_by(id: params[:id])
    if @blog.nil? and (!current_user.admin?)
      flash[:warning] = ["抱歉！您没有权限编辑其他用户的博客。"]
      redirect_back fallback_location: blogs_path
    end
  end

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    @blog.tourist_route = TouristRoute.find_by(blog_id: params[:id])
  end

  def vote
    @blog = Blog.find(params[:id])
    @blog.votes += 1
    @blog.save
  end

  # GET /blogs/new
  def new
    # @blog = Blog.new
    @blog = current_user.blogs.build
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  def get_errors
    errors = []

    if blog_params[:title].nil? or blog_params[:title].blank?
      errors << "标题不能为空！"
    end
    if blog_params[:title].length > 10
      errors << "标题需要在10个字以内哦~"
    end
    if blog_params[:content].nil? or blog_params[:content].blank?
      errors << "内容不能为空！"
    end
    errors
  end

  # POST /blogs or /blogs.json
  def create
    # @blog = Blog.new(blog_params)
    tourist_route_id = params[:blog][:tourist_route_id].to_i
    @blog = current_user.blogs.build(blog_params)
    if tourist_route_id != 0
      tourist_route = TouristRoute.find(tourist_route_id)
      @blog.tourist_route = tourist_route
    end

    errors = get_errors

    respond_to do |format|
      if tourist_route_id != 0 and blog_params[:title].length <= 10 and  @blog.save
        format.html { redirect_to blog_url(@blog), notice: "成功创建博客！" }
        format.json { render :show, status: :created, location: @blog }
      else
        flash[:error] = get_errors
        if tourist_route_id == 0
          flash[:error] << "未选择旅游路线！"
        end
        format.html { redirect_back_or_to blogs_path }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    @blog = Blog.find(params[:id])
    respond_to do |format|
      if blog_params[:title].length <= 10 and @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "成功修改博客！" }
        format.json { render :show, status: :ok, location: @blog }
      else
        flash[:error] = get_errors
        format.html { redirect_back_or_to blog_url(@blog) }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "成功删除博客！" }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :content, :votes, :view_times,
                                 :user_id, :tourist_route_id, :image)
  end
end
