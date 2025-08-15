class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6}
  validates :movie_id, uniqueness: { scope: [:list_id], message: "You cannot give 2 comments on the same movie in the same list"}
end
