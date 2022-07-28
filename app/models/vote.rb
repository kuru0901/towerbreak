class Vote < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :user_id, presence: true
  validates :property_id, presence: true
  validates :user_id, uniqueness: { scope: :property_id }, unless: -> { user_id == 1 }
end
