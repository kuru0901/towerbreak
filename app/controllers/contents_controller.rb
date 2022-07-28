class ContentsController < ApplicationController
  def show
    @content = Content.find(params[:id])
    @comments = @content.comments
  end
end
