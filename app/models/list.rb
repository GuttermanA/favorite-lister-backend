class List < ApplicationRecord
  has_many :list_movie_users
  has_many :movies, through: :list_movie_users
  has_many :users, through: :list_movie_users
  validates :title, presense: true
end
