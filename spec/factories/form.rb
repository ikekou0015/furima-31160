FactoryBot.define do
  factory :form do
    postal_code          { '111-0000' }
    prefecture_id        { '2' }
    city                 { 'あああ' }
    addresses            { 'あああ' }
    phone_number         { '0000000000' }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
