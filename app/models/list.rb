class List < ApplicationRecord
  has_many :movie_lists
  has_many :movies, through: :movie_lists
  belongs_to :user
  validates :title, presence: true
end
