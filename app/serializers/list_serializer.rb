class ListSerializer < ActiveModel::Serializer
  attributes :title, :movies
  # has_many :movie_lists, include_nested_associations: true



  #
  def movies
    movies = []
    object.movies do |movie|
      movies.push(movie)
    end
    object.movies
  end

end
