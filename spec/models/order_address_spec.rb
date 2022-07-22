require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての項目が入力されていれば保存できる' do
        expect(@order_address).to be_valid
    end
  end
   context '購入できない時'do
   it'郵便番号が空だと保存できない'do
   @order_address.postnum = ''
   @order_address.valid?
   expect(@order_address.errors.full_messages).to include("Postnum can't be blank")
  end

  it'郵便番号が3桁ハイフン4桁の半角文字列のみ保存可能'do
  @order_address.postnum = 'aaaaaaaa'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Postnum is not a number")
  end

  it'市区町村が空だと保存ができない'do
  @order_address.municipality = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
  end

  it'番地が空だと保存できない'do
  @order_address.addressnum = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Addressnum can't be blank")
  end

  it'電話番号が空だと保存できない'do
  @order_address.phonenum = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Phonenum can't be blank")
  end

  it'電話番号が10桁以上11桁以内の半角数値のみ保存可能なこと'do
  @order_address.phonenum = 'aaaaaa'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Phonenum is not a number")
  end

  it'都道府県名が空だと保存できない'do
  @order_address.area_id = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Area can't be blank")
  end
 
  it '都道府県名のidが1であれば保存できない' do
    @order_address.area_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Area must be other than 1')
   end

end
end
end

 
