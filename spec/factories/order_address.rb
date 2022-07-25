FactoryBot.define do
  factory :order_address do
    postnum { '111-1111' }
    area_id { 2 }
    municipality { '市町村' }
    addressnum { 3 }
    phonenum { '1911234567' }
    token { 'tok_abcdefghijk00000000000000000' }
    buildingname{'建物'}
    
    
  end
end
