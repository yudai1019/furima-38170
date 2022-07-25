FactoryBot.define do
  factory :order_address do
    postnum { '111-1111' }
    area_id { 2 }
    municipality { '市町村' }
    addressnum { 3 }
    phonenum { 123_456_789 }
    token { 'tok_abcdefghijk00000000000000000' }
    buildingname{'建物'}
    user_id {2}
    item_id {2}
    
  end
end
