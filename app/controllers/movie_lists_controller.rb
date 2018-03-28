class MovieListsController < ApplicationController
  def index
    @movie_lists = MoveList.all
    render json: @movie_lists
  end
end
