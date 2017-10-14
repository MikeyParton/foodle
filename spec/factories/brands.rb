FactoryGirl.define do
  factory :brand do
    name { FFaker::Product.brand }
  end
end
