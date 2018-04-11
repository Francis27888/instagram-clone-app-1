class User < ApplicationRecord
  mount_uploader :image,ImageUploader
  validates :names,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :username, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }, :if => :password
  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :favorite_posts,through: :favorites,source: :post
  has_secure_password
end
