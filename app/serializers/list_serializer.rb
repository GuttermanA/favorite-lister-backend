class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :movies, :updated_at

  def movies
    object.movies
  end

end
