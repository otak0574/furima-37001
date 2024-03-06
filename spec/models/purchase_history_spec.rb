require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    sleep 0.1
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品を購入できる場合' do
      it '必要な情報を入力すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても保存できる' do
        @purchase_address.building = ""
        expect(@purchase_address).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it '郵便番号が必須であること' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_address.post_number = '1234567890123456789012345678901234567890123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid. Include hyphen(- ")
      end
      it ' 都道府県が必須であること' do
        @purchase_address.pref_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Pref can't be blank")
      end
      it '市区町村が必須であること' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が必須であること' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は10桁以下は保存できない' do
        @purchase_address.telephone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号は11桁以上は保存できない' do
        @purchase_address.telephone_number = '1234567890123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号は半角数値のみ保存可能なこと' do
        @purchase_address.telephone_number = '１テストTEST'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
    end
  end
end
