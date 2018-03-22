class MoviesController < ApplicationController
  def search
    @movies = ApiAdapter.search(params[:search_term])
    render json: @movies
  end

  def index
    @movies = Movie.limit(10)
    render json: @movies
  end
end
