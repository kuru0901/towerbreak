class Property < ApplicationRecord
  belongs_to :user
  belongs_to :content
  validates :user_id, uniqueness: true, { scope: :content_id }
end
