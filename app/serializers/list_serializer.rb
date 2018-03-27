class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :movies, :updated_at

  def movies
    object.movies.joins(:movie_lists).order("movie_lists.position ASC").references(:movie_lists)
  end

end
