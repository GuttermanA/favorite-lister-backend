class MoviesController < ApplicationController
  def search
    @movies = ApiAdapter.search(search_term: params[:search_term])
    render json: @movies
  end

  def index
    @movies = Movie.limit(10)
    render json: @movies
  end
end
