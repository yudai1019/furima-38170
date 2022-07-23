class OrderAddress
 include ActiveModel::Model
 attr_accessor :municipality,:addressnum,:buildingname,:phonenum,:order_id,:user_id,:item_id,:area_id, :postnum,:token
 
 
 validates :postnum, presence: true,numericality: {with:/\A[0-9]{3}-[0-9]{4}\z/}
 validates :municipality,presence: true
 validates :addressnum,presence: true
 validates :phonenum,presence: true,numericality: {with:/\A\d{10,11}\z/}
 validates :area_id,presence: true,numericality: { other_than: 1 }
 

 def save               
  order = Order.create(user_id: user_id,item_id: item_id)
  Address.create(postnum: postnum,municipality: municipality,addressnum: addressnum,buildingname: buildingname ,phonenum: phonenum,order_id: order.id,area_id: area_id)
 end
end