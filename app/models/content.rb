class Content < ApplicationRecord
  enum category: { uncategorized: 0, book: 1, game: 2, movie: 3, tv_programming: 4 }
  has_many :properties
  validates :title, presence: true
  validates :category, presence: true
  validates :title, uniqueness: { scope: :category }
end
