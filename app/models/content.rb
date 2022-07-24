class Content < ApplicationRecord
  enum :category, { uncategorized: 0, book: 1, game: 2, movie: 3, tv_programming: 4 }
  validates :title, presence: true
  validates :category, presence: true
  validates :title, uniqueness: true { scope: :category }
end
