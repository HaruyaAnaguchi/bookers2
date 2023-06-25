class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 1 }
  validates :body, presence: true, length: { in: 1..200 }

end
