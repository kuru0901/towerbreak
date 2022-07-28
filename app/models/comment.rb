class Comment < ApplicationRecord
  belongs_to :content
  belongs_to :user
  validates :body, presence: true
end
