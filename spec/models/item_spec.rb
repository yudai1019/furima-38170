require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '保存できるとき' do
      it '全ての項目が入力されていれば登録される' do
        expect(@item).to be_valid
      end
    end

    context '保存できないとき' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の情報が空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it '配送料の負担が空では登録できない' do
        @item.load_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end

      it '発送元の地域が空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it '発送までの日数が空では登録できない' do
        @item.wait_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Wait can't be blank")
      end

      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が¥300より少ない時は出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が¥9999999より多い時は出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '販売価格は半角数値のみ保存可能' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'Categoryのidが1であれば保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'Stateのidが1であれば保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end

      it 'Loadのidが1であれば保存できない' do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Load must be other than 1')
      end

      it 'Areaのidが1であれば保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end

      it 'Waitのidが1であれば保存できない' do
        @item.wait_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Wait must be other than 1')
      end
    end
  end
end
