FactoryBot.define do
  factory :product do
    category { "paintings" }
    name { "Elmo Raising" }
    price { 456 }
    description { "Beautiful painting" }

    trait :with_valid_image do
      after :build do |product|
        file_name = "image_test.png"
        file_path = Rails.root.join( 'storage', file_name)
        product.image.attach(io: File.open(file_path), filename: file_name, content_type: 'image/png')
      end
    end

    trait :with_invalid_image_size do
      after :build do |product|
        file_name = "invalid_image_size_test.jpg"
        file_path = Rails.root.join( 'storage', file_name)
        product.image.attach(io: File.open(file_path), filename: file_name, content_type: 'image/jpg')
      end
    end

    trait :with_invalid_image_type do
      after :build do |product|
        file_name = "invalid_image_type_test.pdf"
        file_path = Rails.root.join( 'storage', file_name)
        product.image.attach(io: File.open(file_path), filename: file_name, content_type: 'image/pdf')
      end
    end
  end
end
