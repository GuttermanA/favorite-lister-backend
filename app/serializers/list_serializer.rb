class ListSerializer < ActiveModel::Serializer
  attributes :title, :movies, :updated_at

  def movies
    object.movies
  end

end
