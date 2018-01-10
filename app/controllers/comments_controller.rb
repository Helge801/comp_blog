class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show], user: :all, admin: :all


  def index

  end


  def show
  end


  def new
    @comment = comment.new
  end


  def edit
  end


  def create
    @comment = comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: 'comment was successfully created.'
    else
      render :new
    end
  end


  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'comment was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'comment was successfully destroyed.'
  end

  private

    def set_comment
      @comment = comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:body, :user_id, :blog_id)
    end

end