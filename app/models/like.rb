class Like < ApplicationRecord
  belongs_to :list, counter_cache: :like_count
  belongs_to :user
end
