class PropertiesController < ApplicationController
  def create
    content = Content.find_or_create_by(title: content_params[:title], category: content_params[:category])
    property = Property.new(user_id: current_user.id)
    binding.pry
    content.properties << property
    binding.pry
  end

  private

  def content_params
    params.require(:content).permit(:title, :category)
  end
end
