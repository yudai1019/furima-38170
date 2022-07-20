calss ItemAdress
 include ActiveModel::Model
 attr_accessor :name,:description_item , :category_id,:state_id,:load_id, :wait_id,:price,:user, :area_id,:municipality,:addressnum、:buildingname、:phonenum,:order
 
 validates :name, presence: true
 validates :description_item, presence: true
 validates :category_id, presence: true, numericality: { other_than: 1 }
 validates :state_id, presence: true, numericality: { other_than: 1 }
 validates :load_id, presence: true, numericality: { other_than: 1 }
 validates :area_id, presence: true, numericality: { other_than: 1 }
 validates :wait_id, presence: true, numericality: { other_than: 1 }
 validates :price, presence: true, numericality: { with: /\A[0-9]+\z/ },
                   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
 validates :image, presence: true
 validates :postnum, presence: true
 validates :municipality,presence: true
 validates :addressnum,presence: true
 validates :buildingname 
 validates :phonenum,presence: true
 
 def save
  Item.create(name: name, description_item: description_item,category_id: category_id,state_id: state_id,load_id: load_id,area_id: area_id,wait_id: wait_id,price: price,image: image,user_id: user.id)
  Address.create(postnum: postnum,municipality: municipality,addressnum: addressnum,buildingname: buildingname,buildingname: buildingname,phonenum: phonenum)
 end
end