FactoryBot.define do
  factory :item do
    name                  { 'test' }
    description_item      { 'test' }
    category_id           { 2 }
    state_id              { 2 }
    load_id               { 2 }
    area_id               { 2 }
    wait_id               { 2 }
    price                 { 301 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
