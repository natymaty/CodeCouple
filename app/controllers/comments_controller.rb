class CommentsController < ApplicationController

  def create
    @entry = Entry.find(params[:entry_id])
    @comments = @entry.comments.create(comment_params)
    redirect_to entry_path(@entry)
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
