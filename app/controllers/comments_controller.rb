class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    
    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new
    
    @topic = @post.topic
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      # enter error code here
      flash[:error] = "There was an error saving the comment. Please try again."
    end
    
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end    
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @topic = @post.topic
    
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment deleted successfully."
    else
      flash[:error] = "The comment couldn't be deleted."
    end
    
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
