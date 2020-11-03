FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'hoge12' }
    password_confirmation { password }
    last_name             { 'ああああ' }
    first_name            { 'ああああ' }
    last_name_kana        { 'アアアア' }
    first_name_kana       { 'アアアア' }
    birth_date            { '2000-01-01' }
  end
end
