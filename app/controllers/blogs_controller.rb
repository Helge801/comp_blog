class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show], user: :all, admin: :all

  # GET /blogs
  def index
    @blogs = if params[:query]
       titles = Blog.where('LOWER(title) LIKE ?', "%#{params[:query].downcase}%")
       categories = Blog.where('LOWER(category) LIKE ?', "%#{params[:query].downcase}%")
       titles + categories
    else
      Blog.all
    end
  end

  # GET /blogs/1
  def show
    @comments = @blog.comments.all
    @user = @blog.user
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.image = "https://picsum.photos/600/400/?image=#{[*1..800].sample}"

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:title, :body, :image, :user_id)
    end
end
