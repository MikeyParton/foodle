FactoryGirl.define do
  factory :identity do
    uid       { ('a'..'z').to_a.sample(8).join }
    provider  { %w[facebook google twitter].sample }
    user
  end
end
