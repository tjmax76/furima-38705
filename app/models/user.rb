class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]\z/, message: "全角文字(漢字、ひらがな、カタカナ)のみ使えます"}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]\z/, message: "全角文字(漢字、ひらがな、カタカナ)のみ使えます"}
  validates :katakana_first_name, presence: true, format: {with: /\A[ァ-ン一]\z/, message: "全角カタカナのみ使えます"}
  validates :katakana_last_name, presence: true, format: {with: /\A[ァ-ン一]\z/, message: "全角カタカナのみ使えます"}
  validates :birth_day, presence: true


end
