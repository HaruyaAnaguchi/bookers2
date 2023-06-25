class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1 }
  validates :body, presence: true, length: { in: 1..200 }

end
