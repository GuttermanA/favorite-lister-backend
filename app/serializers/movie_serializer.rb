class MovieSerializer < ActiveModel::Serializer
  attributes :title, :poster_path, :overview, :release_date
  has_many :movie_lists
end
