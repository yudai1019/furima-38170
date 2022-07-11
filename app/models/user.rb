class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password,format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, presence: true
         validates :password_confirmation,format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, presence: true
         validates :nickname, presence: true
         validates :last_name,format: {with:/\A[ぁ-んァ-ン一-龥]/}, presence: true
         validates :first_name,format: {with:/\A[ぁ-んァ-ン一-龥]/}, presence: true
         validates :last_name_kana,format: {with:/\A[ァ-ヶー－]+\z/}, presence: true
         validates :first_name_kana,format: {with:/\A[ァ-ヶー－]+\z/}, presence: true
         validates :date, presence: true
         
 has_many :items
 has_many :orders

end

