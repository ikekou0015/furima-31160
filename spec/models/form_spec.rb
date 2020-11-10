require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end

  describe '購入商品の保存' do
    context '購入商品が保存できる場合' do
      it '全ての項目とトークンが存在すれば購入商品が保存される' do
        expect(@form).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @form.building = ''
        expect(@form).to be_valid
      end
    end

    context '購入商品が保存されない場合' do
      it 'tokenが空では登録できない' do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では保存できない' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがなければ保存できない' do
        @form.postal_code = '0000000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空では保存できない' do
        @form.prefecture_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it 'prefecture_idが選択されてなければ保存できない' do
        @form.prefecture_id = '1'
        @form.valid?
        expect(@form.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空では保存できない' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空では保存できない' do
        @form.addresses = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @form.phone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと保存できない' do
        @form.phone_number = '000000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      
      it 'phone_numberにハイフンがあると保存できない' do
        @form.phone_number = '000-00000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
