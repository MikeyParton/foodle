FactoryGirl.define do
  factory :nutrients do
    energy_base_value         { rand(1000..3000) }
    energy_base_unit          { 'J' }
    proteins_base_value       { rand(1000..10000) }
    proteins_base_unit        'mg'
    carbohydrates_base_value  { rand(1000..10000) }
    carbohydrates_base_unit   'mg'
    fat_base_value            { rand(1000..10000) }
    fat_base_unit             'mg'
    sugars_base_value         { rand(1000..10000) }
    sugars_base_unit          'mg'
    fiber_base_value          { rand(1000..10000) }
    fiber_base_unit           'mg'
    sodium_base_value         { rand(1000..10000) }
    sodium_base_unit          'mg'
    serving_value             100000
    serving_unit              'mg'
    product
  end
end
