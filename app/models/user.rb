class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  validates :username, presence: true, length: { minimum: 3, maximum: 100 }
  paginates_per 3

  #for messages
  has_many :messages, dependent: :destroy
  has_many :student_courses, dependent: :destroy
  has_many :courses, through: :student_courses, dependent: :destroy
  
  def self.all_except(user)
    where.not(id: user)
  end
end
