class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 40 }
  validates_uniqueness_of :name
  has_many :article_categories
  has_many :articles, through: :article_categories
  paginates_per 3
end
