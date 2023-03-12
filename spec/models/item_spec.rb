require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品ができる時' do
      it 'すべてのフォームに正しい値が入力されていれば出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'detailが空だと出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category カテゴリーは必須項目です')
      end

      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category カテゴリーは必須項目です')
      end

      it 'condition_idが空だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition 状態は必須項目です')
      end

      it 'condition_idが1だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition 状態は必須項目です')
      end

      it 'shipping_charge_idが空だと出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge 送料の負担は必須項目です')
      end

      it 'shipping_charge_idが1だと出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge 送料の負担は必須項目です')
      end

      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture 発送元地域は必須項目です')
      end

      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture 発送元地域は必須項目です')
      end

      it 'shipping_dateが空だと出品できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date 発送までの日数は必須項目です')
      end

      it 'shipping_dateが1だと出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date 発送までの日数は必須項目です')
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300 ~ ¥9,999,999の整数で指定してください')
      end

      it 'priceが300より小さいと出品できない' do
        @item.price = rand(0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300 ~ ¥9,999,999の整数で指定してください')
      end

      it 'priceが9999999より大きいと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300 ~ ¥9,999,999の整数で指定してください')
      end

      it 'priceが半角数字以外の値だと出品できない' do
        @item.price = Faker::Lorem.word
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300 ~ ¥9,999,999の整数で指定してください')
      end

      it 'priceが小数を含んでいるとと出品できない' do
        @item.price = 100.8
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300 ~ ¥9,999,999の整数で指定してください')
      end

      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
