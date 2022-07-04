class Course < ApplicationRecord
  validates :short_name, presence: true, length: { minimum: 3, maximum: 10 }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3, maximum: 300 }
  has_many :student_courses
  has_many :users, through: :student_courses
end
