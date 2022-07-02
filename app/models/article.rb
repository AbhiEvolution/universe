class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }

  validates :description, presence: true, length: { minimum: 3, maximum: 300 }

  paginates_per 3
end
