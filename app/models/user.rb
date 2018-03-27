class User < ApplicationRecord
  has_many :lists
  validates :name, uniqueness: true
  has_secure_password

  def movies
    movies = []
    self.lists.each do |list|
      list.movies.each do |movie|
        movies.push(movie)
      end
    end
    movies
  end

end
