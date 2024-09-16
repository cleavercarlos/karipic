class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_image,  dependent: :destroy

  validates :name, presence: true
end