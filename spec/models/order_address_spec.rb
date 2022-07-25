require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,item_id: item.id,user_id: user.id)
    sleep 0.05
  end
  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての項目が入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる'do
        @order_address.buildingname = ''
        expect(@order_address).to be_valid
       end
        
    end
    context '購入できない時' do
      it '郵便番号が空だと保存できない' do
        @order_address.postnum = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postnum can't be blank")
      end

      it '郵便番号が3桁ハイフン4桁の半角文字列のみ保存可能' do
        @order_address.postnum = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postnum is invalid')
      end

      it '市区町村が空だと保存ができない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと保存できない' do
        @order_address.addressnum = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addressnum can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_address.phonenum = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenum can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @order_address.phonenum = '191123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenum is invalid")
      end

      it '電話番号が12桁以上では購入できない' do
        @order_address.phonenum = '191123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenum is invalid")
      end 

      it '電話番号が10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_address.phonenum = 'aaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenum is invalid")
      end

      it '都道府県名が空だと保存できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it '都道府県名のidが1であれば保存できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area must be other than 1')
      end

      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it'ユーザーが紐づいていないと保存できない'do
       @order_address.user_id = nil
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("User can't be blank")
     end
     it'商品が紐づいていないと保存できない'do
       @order_address.item_id = nil
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Item can't be blank")
     end
    end
  end
end
