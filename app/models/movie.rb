class Movie < ApplicationRecord
  has_many :list_movie_users
  has_many :users, through: :list_movie_users
  has_many :lists, through: :list_movie_users
  validates :title, uniqueness: true
end
