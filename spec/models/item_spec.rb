require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を登録できる場合' do
      it '必要な情報を入力すれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を登録できない場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it ' 商品の状態の情報が必須であること' do
        @item.spec_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Spec can't be blank")
      end
      it ' 配送料の負担の情報が必須であること' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '発送元の地域の情報が必須であること' do
        @item.pref_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref can't be blank")
      end
      it '発送までの日数の情報が必須であること' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥300以上で保存可能であること' do
        @item.price = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は、¥9,999,999以下で保存可能であること' do
        @item.price = '1000000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格は整数のみ保存可能であること' do
        @item.price = '1000.1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
