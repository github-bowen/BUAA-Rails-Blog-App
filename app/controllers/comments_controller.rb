class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  # before_action :authenticate, except: [:index, :show]
  before_action :authenticate_user!
  # before_action :set_user, except: []
  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # def correct_user
  #   @comment = current_user.blogs.find_by(id: params[:id])
  #   redirect_back fallback_location: blogs_path,
  #                 notice: "抱歉！您没有权限删除其他用户的评论。" if @blog.nil? and (!current_user.admin?)
  # end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new(comment_params)
    @comment.blog = @blog
    # @comment.user = current_user
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @blog, notice: "评论发表成功！" }
        format.json { render :show, status: :created, location: @comment }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.html { render "blogs/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @blog, notice: "评论更新成功！" }  # 用不到
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render "blogs/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    @blog = Blog.find[params[:blog_id]]

    respond_to do |format|
      format.html { redirect_back_or_to @blog, notice: "评论删除成功！" }
      format.json { head :no_content }
    end
  end

  private

  # def authenticate
  #   # code here
  #   authenticate_or_request_with_http_basic "请输入用户名和密码", "登录不了吧，哈哈哈" do |username, password|
  #     username == "lbh" && password == "xm011121"
  #   end
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
