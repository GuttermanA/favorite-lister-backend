class ListMovieUser < ApplicationRecord
  belongs_to :lists
  belongs_to :users
  belongs_to :movies
  validates :user_id, :list_id, presence: true
end
