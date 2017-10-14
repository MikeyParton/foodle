FactoryGirl.define do
  factory :product do
    name      { FFaker::Food.ingredient }
    barcode   { rand(100000000000..199999999999) }
  end
end
