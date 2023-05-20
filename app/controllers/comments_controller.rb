class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to building_path(@comment.building)
    else
      @building = @comment.building
      @comments = @building.comments
      render 'buildings/show'
    end
  end

  def destroy
    @building = Building.find(params[:building_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, building_id: params[:building_id])
  end
end
