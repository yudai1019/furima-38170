class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :date, presence: true

  has_many :items
  # has_many :orders
end
