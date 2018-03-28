class MoviesController < ApplicationController
  def search
    @movies = ApiAdapter.search(search_term: params[:search_term])
    render json: @movies
  end

  def default
    # @movies = Movie.take(10)
    @movies = ApiAdapter.default
    render json: @movies
  end

  def index
    @movies = Movie.take(10)
    render json: @movies
  end
end
