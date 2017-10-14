FactoryGirl.define do
  factory :ingredient do
    name { FFaker::Food.ingredient }
  end
end
