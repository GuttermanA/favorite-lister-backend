class MovieListSerializer < ActiveModel::Serializer
  attributes :list_id, :movie_id
  belongs_to :movies, serializer: MovieSerializer
  belongs_to :lists, serializer: ListSerializer
  # def movies
  #   object.movies
  # end
end
