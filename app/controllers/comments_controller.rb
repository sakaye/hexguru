class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Your comment was posted"
      redirect_to :back
    else
      render 'cards/show'
    end
  end

  def destroy
  end
end
