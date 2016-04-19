class CommentsController < ApplicationController

  before_action :require_sign_in

  before_action :authorize_user, only: [:destroy]

  def create
    if (params[:post_id])
      @post = Post.find(params[:post_id])
      comment = @post.comments.new(comment_params)
    elsif (params[:topic_id])
      @topic = Topic.find(params[:topic_id])
      comment = @topic.comments.new(comment_params)
    end
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved successfully."
      # #12
      if @post.nil? == false
        redirect_to [@post.topic, @post]
      else
        redirect_to [@topic, @topic]
      end
    else
      flash[:alert] = "Comment failed to save."
      # #13
      if @post.nil? == false
        redirect_to [@post.topic, @post]
      else
        redirect_to [@topic, @topic]
      end
    end
  end

  def destroy
    if (params[:post_id])
      @post = Post.find(params[:post_id])
      comment = @post.comments.new(comment_params)
    elsif (params[:topic_id])
      @topic = Topic.find(params[:topic_id])
      comment = @topic.comments.new(comment_params)
    end

    if comment.destroy
      flash[:notice] = "Comment was deleted successfully."
      if @post.nil? == false
        redirect_to [@post.topic, @post]
      else
        redirect_to [@topic, @topic]
      end
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      if @post.nil? == false
        redirect_to [@post.topic, @post]
      else
        redirect_to [@topic, @topic]
      end
    end
  end

  private

  # #14
  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
