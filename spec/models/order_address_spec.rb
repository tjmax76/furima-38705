require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入機能' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @OdAd = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.03
    end

    context '入力内容が正常であるとき' do
      it '全ての入力欄に正しい値が入力されていれば購入できる' do
        expect(@OdAd).to be_valid
      end

      it 'building_nameは空でも購入できる' do
        @OdAd.building_name = nil
        expect(@OdAd).to be_valid
      end
    end

    context '入力内容に問題があるとき' do
      it 'post_addressが空だと購入できない' do
        @OdAd.post_address = nil
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include "Post address can't be blank"
      end

      it 'post_addressが数字3ケタ、ハイフン(-)、数字4ケタの並びでないと購入できない' do
        @OdAd.post_address = '123-456'
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include 'Post address 郵便番号は半角数字でハイフンを含めて入力してください'
      end

      it 'prefecture_idが1(---)だと購入できない' do
        @OdAd.prefecture_id = 1
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include 'Prefecture 都道府県を選択してください'
      end

      it 'city_ward_town_villageが空だと購入できない' do
        @OdAd.city_ward_town_village = nil
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include "City ward town village can't be blank"
      end

      it 'house_numberが空だと購入できない' do
        @OdAd.house_number = nil
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include "House number can't be blank"
      end

      it 'phone_numberが空だと購入できない' do
        @OdAd.phone_number = nil
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが10〜11ケタの半角数字でないと購入できない' do
        @OdAd.phone_number = '123456789'
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include 'Phone number 電話番号はハイフンを入れずに10ケタもしくは11ケタの半角数字で入力してください'
      end

      it 'userが紐付いていないと購入できない' do
        @OdAd.user_id = nil
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐づいていないと購入できない' do
        @OdAd.item_id = nil
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include "Item can't be blank"
      end

      it 'tokenが空だと購入できない' do
        @OdAd.token = nil
        @OdAd.valid?
        expect(@OdAd.errors.full_messages).to include 'Token クレジットカード情報を正しく入力してください'
      end
    end
  end
end
