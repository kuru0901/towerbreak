class Property < ApplicationRecord
  belongs_to :user
  belongs_to :content
  has_many :votes, dependent: :destroy
  validates :user_id, uniqueness: { scope: :content_id }

  def voted_by?(user)
    if user
      votes.exists?(user_id: user.id)
    end
  end
end
