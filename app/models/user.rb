class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "英数字を両方使用してください"}
  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶー－龥]+\z/, message: "全角文字(漢字、ひらがな、カタカナ)のみ使えます"}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶー－龥]+\z/, message: "全角文字(漢字、ひらがな、カタカナ)のみ使えます"}
  validates :katakana_first_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみ使えます"}
  validates :katakana_last_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみ使えます"}
  validates :birth_day, presence: true


end
