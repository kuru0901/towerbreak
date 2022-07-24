class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :user_id, presence: true
  validates :property_id, presence: true
  validates :user_id, uniqueness: true, { scope: :property_id }, unless: -> { user_id.include?('*') }
end
