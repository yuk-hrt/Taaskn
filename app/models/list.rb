class List < ApplicationRecord
  has_many :cards, -> {rank(:row_order)}, dependent: :destroy
  belongs_to :user
end
