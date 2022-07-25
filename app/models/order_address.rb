class OrderAddress
  include ActiveModel::Model
  attr_accessor :municipality, :addressnum, :buildingname, :phonenum, :order_id, :user_id, :item_id, :area_id, :postnum, :token

  with_options presence: true do
  validates :postnum,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :municipality
  validates :addressnum
  validates :phonenum,  format: { with: /\A\d{10,11}\z/ }
  validates :area_id, numericality: { other_than: 1 }
  validates :token
  validates :user_id
  validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postnum: postnum, municipality: municipality, addressnum: addressnum, buildingname: buildingname,
                   phonenum: phonenum, order_id: order.id, area_id: area_id)
  end
end
