FactoryBot.define do
  factory :product do
    category { "paintings" }
    name { "Elmo Raising" }
    price { 456 }
    description { "Beautiful painting" }
  end
end
