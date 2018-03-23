class ListsController < ApplicationController

  def index
    @lists = List.all
    render json: @lists, each_serializer: ListSerializer
  end

  def create
    request_body = JSON.parse(request.body.read)
    @list = List.new(title: request_body["title"], user_id: 1)
    if @list.save
      request_body["movies"].each_with_index do |movie, index|
        new_movie = Movie.find_or_create_by(title: movie["title"], poster_path: movie["poster_path"], release_date: movie["release_date"], overview: movie["overview"])
        MovieList.create(list_id: @list.id, movie_id: new_movie.id, position: index + 1)
      end
      render json: {message: "Success", list_title: @list.title}
    else
      render json: {message: "Failure"}
    end
  end
end
