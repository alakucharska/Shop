require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) { build(:product) }

  describe " with valid parameters" do
    it "saves product" do
      expect(product).to be_valid
      expect { product.save! }.to change { Product.count}.by(1)
    end

    describe ".sort_by_name" do
      let!(:product1) { create(:product, name: "Rain")}
      let!(:product2) { create(:product, name: "Blanket")}
      let!(:product3) { create(:product, name: "Dress")}
      it "lists products in alphabetical order" do
        expect(Product.sort_by_name).to match_array([product2, product3, product1])
      end
    end
  end

  describe "with invalid parameters" do
    describe "#name" do
      it "validates presence" do
        product = build(:product, name: nil)
        expect(product).not_to be_valid
      end

      it "validates length" do
        product = build(:product, name: "Elmo Raising"*50) 
        expect(product).not_to be_valid
      end
    end

    describe "#price" do
      it "validates presence" do
        product = build(:product, price: nil) 
        expect(product).not_to be_valid
      end

      it "validates value" do
        product = build(:product, price: "dwa")
        expect(product).not_to be_valid
      end
    end

    describe "#description" do
      it "validates presence" do
        product = build(:product, description: nil) 
        expect(product).not_to be_valid
      end

      it "validates length" do
        product = build(:product, description: "Beautiful painting"*250) 
        expect(product).not_to be_valid
      end
    end

    describe "#category" do
      it "validates presence" do
        product = build(:product, category: nil) 
        expect(product).not_to be_valid
      end
    end
  end
end
