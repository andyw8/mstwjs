class TopicsController < ApplicationController
  def index
    render json: Topic.all
  end

  def show
    topic = Topic.find params[:id]
    render json: topic
  end
end
