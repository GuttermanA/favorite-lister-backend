class User < ApplicationRecord
  has_many :list_movie_users
  has_many :movies, through: :list_movie_users
  has_many :lists, through: :list_movie_users
  validates :name, uniqueness: true
  has_secure_password
end
