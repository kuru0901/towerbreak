class VotesController < ApplicationController
  def create
    user = Property.find(params[:property_id]).user
    vote_user_id = logged_in? ? current_user.id : 1
    vote = Vote.new(user_id: vote_user_id, property_id: params[:property_id])
    vote.save!
    redirect_to user_properties_path(user)
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy!
    redirect_to user_properties_path(vote.property.user)
  end
end
