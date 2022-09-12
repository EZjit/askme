class Question < ApplicationRecord

  validates :body, presence: true, length: { minimum: 3 }
  validates :user_id, presence: true
end
