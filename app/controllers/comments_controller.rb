class CommentsController < ApplicationController
  http_basic_authenticate_with name: "Klausthezebra", password: "monkeysareannoying", only: :destroy

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.create(comment_params)
    redirect_to entry_path(@entry)
  end

  def destroy
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.find(params[:id])
    @comment.destroy
    redirect_to entry_path(@entry)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
