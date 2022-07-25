FactoryBot.define do
  factory :user do
    email                  {Faker::Internet.free_email}
    password               { '00000a' }
    password_confirmation  { '00000a' }
    nickname               { 'test' }
    first_name             { '山田' }
    last_name              { '太郎' }
    first_name_kana        { 'ヤマダ' }
    last_name_kana         { 'タロウ' }
    date                   { '1999-10-10' }
  end
end
