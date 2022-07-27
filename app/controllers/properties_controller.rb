class PropertiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @content = Content.new
    @categories = categories_set
    @properties = properties_set
  end

  def create
    @content = Content.find_or_create_by(title: content_params[:title], category: content_params[:category])
    property = Property.new(user_id: current_user.id, content_id: @content.id)
    if property.save
      redirect_to(user_properties_path(current_user), notice: '登録しました')
    else
      @user = User.find(params[:user_id])
      @categories = categories_set
      @properties = properties_set
      flash.now[:alert] = '登録できませんでした'
      render :index
    end
  end

  def destroy
    property = Property.find(params[:id])
    user = property.user
    property.destroy!
    redirect_to user_properties_path(user)
  end

  private

  def categories_set
    Content.select(:category).distinct
  end

  def properties_set
    User.find(params[:user_id]).properties
  end

  def content_params
    params.require(:content).permit(:title, :category)
  end
end
