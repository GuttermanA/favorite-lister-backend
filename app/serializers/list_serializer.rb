class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :movies, :updated_at

  def movies
    sql = "
      SELECT
      movies.id,
      movies.title,
      movies.poster_path,
      movies.overview,
      movies.release_date,
      movie_lists.position
      FROM movies
      INNER JOIN movie_lists ON
      movie_lists.movie_id = movies.id
      INNER JOIN lists ON
      lists.id = movie_lists.list_id
      WHERE lists.id = ?
      ORDER BY movie_lists.position ASC
    "
    Movie.find_by_sql [sql, object.id]
    # object.movies.select(:id,:title, :poster_path, :overview, :release_date, "movie_lists.list").distinct.joins(:movie_lists)
  end

end
