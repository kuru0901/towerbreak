class VotesController < ApplicationController
  def create
    user = Property.find(params[:property_id]).user
    vote_user_id = logged_in? ? current_user.id : 1
    vote = Vote.new(user_id: vote_user_id, property_id: params[:property_id])
    vote.save!
    redirect_to user_properties_path(user)
  end

  def update
    vote = Vote.find(params[:id])
    user = vote.user
    if vote.update(comment: comment_params[:comment])
      redirect_to user_properties_path(user)
    else
      render 'user/property'
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:vote).permit(:comment)
  end
end
