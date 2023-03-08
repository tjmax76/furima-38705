require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる時' do
      it 'すべてのフォームに正しい値が入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが登録済みのものだと登録できない' do
        @user.save
        user = FactoryBot.build(:user)
        user.email = @user.email
        user.valid?
        expect(user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@がないと登録できない' do
        @user.email.slice!(/@+/)
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下だと登録できない' do
        @user.password = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが英数字混合でないと登録できない' do
        @user.password = "abcbbb"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字を両方使用してください")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = @user.password + "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'first_nameに全角の漢字・ひらがな・カタカナ以外の文字が使用されていると登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字(漢字、ひらがな、カタカナ)のみ使えます")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameに全角の漢字・ひらがな・カタカナ以外の文字が使用されていると登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字(漢字、ひらがな、カタカナ)のみ使えます")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'katakana_first_nameに全角カタカナ以外の文字が使用されていると登録できない' do
        @user.katakana_first_name = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name 全角カタカナのみ使えます")
      end

      it 'katakana_first_nameが空だと登録できない' do
        @user.katakana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end

      it 'katakana_last_nameに全角カタカナ以外の文字が使用されていると登録できない' do
        @user.katakana_last_name = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name 全角カタカナのみ使えます")
      end

      it 'katakana_last_nameが空だと登録できない' do
        @user.katakana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
      end

      it 'birth_dayが空だと登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
