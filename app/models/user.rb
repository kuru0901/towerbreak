class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :properties, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true,
  if: -> { new_record? || changes[:crypted_password] }
end
