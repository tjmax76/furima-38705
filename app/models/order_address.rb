class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_address, :prefecture_id, :city_ward_town_village, :house_number, :building_name, :phone_number, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :post_address, format: { with: /\A\d{3}-\d{4}\z/, message: '郵便番号は半角数字でハイフンを含めて入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: '都道府県を選択してください' }
    validates :city_ward_town_village
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '電話番号はハイフンを入れずに10ケタもしくは11ケタの半角数字で入力してください' }
    validates :user_id
    validates :item_id
  end
  validates :token, presence: { message: 'クレジットカード情報を正しく入力してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_address: post_address, prefecture_id: prefecture_id, city_ward_town_village: city_ward_town_village,
                   house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
