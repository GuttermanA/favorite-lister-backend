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

  def update
    request_body = JSON.parse(request.body.read)
    @list = List.find_by(id: request_body["id"])
    if @list
      to_delete = @list.movies.map{|m| m.id} - request_body["movies"].map{|m| m["id"]}
      if to_delete.length > 0
        to_delete.each do |id|
          list_entry = MovieList.find_by(list_id: @list.id, movie_id: id)
          list_entry.destroy
        end
      end
      request_body["movies"].each_with_index do |movie, index|
        list_entry = MovieList.find_by(list_id: @list.id, movie_id: movie["id"])
        list_entry.position = index + 1
        list_entry.save
      end
      render json: {message: "List #{@list.title} updated"}
    else
      render json: {message: "Failed to update #{@list.title}"}
    end
  end

  def destroy
    byebug
    @list = List.find_by(id: params[:id])
    if @list.destroy
      render json: {message: "Success, list deleted"}
    else
      render json: {message: "List could not be deleted"}
    end
  end
end
