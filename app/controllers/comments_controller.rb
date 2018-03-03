class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_account,
  # def index
  #   @comments = Comments.all
  # end

  def show
  end

  def new
    @comment = @account.comments.new
  end

  def edit
  end

  def create
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      flash.now[:danger] = "error"
    end
  end
  # def update
  #   if @comment.update()
  # end

  def destroy
    @comment.destroy
    redirect_to @movie(:id)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_account
      @account = User.find(params[:id])
    end
end
