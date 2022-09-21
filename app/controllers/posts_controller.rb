class PostsController < ApplicationController
  before_action :authenticate

  def index
    render json: Post.all
  end
end
