class Item < ApplicationRecord
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'カテゴリーは必須項目です' }
  validates :condition_id, numericality: { other_than: 1, message: '状態は必須項目です' }
  validates :shipping_charge_id, numericality: { other_than: 1, message: '送料の負担は必須項目です' }
  validates :prefecture_id, numericality: { other_than: 1, message: '発送元地域は必須項目です' }
  validates :shipping_date_id, numericality: { other_than: 1, message: '発送までの日数は必須項目です' }
  validates :price, numericality: { in: 300..9_999_999, message: '¥300 ~ ¥9,999,999の範囲で指定してください' }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date
end
