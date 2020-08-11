class List < ApplicationRecord
  has_many :cards, -> {rank(:row_order)}, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
