class Item < ApplicationRecord
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, numericality: { other_than: 1, message: '必須項目です' }
  validates :condition_id, numericality: { other_than: 1, message: '必須項目です' }
  validates :shipping_charge_id, numericality: { other_than: 1, message: '必須項目です' }
  validates :prefecture_id, numericality: { other_than: 1, message: '必須項目です' }
  validates :shipping_date_id, numericality: { other_than: 1, message: '必須項目です' }
  validates :price, presence: true

  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date

end
