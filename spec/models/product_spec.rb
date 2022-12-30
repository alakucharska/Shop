require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) { build(:product) }

  describe "#category" do
    it "validates presence of the category" do
      expect(product).to be_valid
    end

    context "not valid attribute" do
      let!(:product) { build(:product, category: nil) }

      it "does not save the product, if category has not been provided" do
        expect(product).not_to be_valid
      end
    end
  end

  describe "#name" do
    it "validates presence of the name" do
      expect(product).to be_valid
    end

    it "does not save the product if name has not been provided" do
      product = build(:product, name: nil) 
      expect(product).not_to be_valid
    end

    it "does not save the product if the name is too long" do
      product = build(:product, name: "Elmo Raising"*50) 
      expect(product).not_to be_valid
    end
  end

  describe "#price" do
    it "validates presence of the price" do
      expect(product).to be_valid
    end

    it "does not save the product if price has not been provided" do
      product = build(:product, price: nil) 
      expect(product).not_to be_valid
    end

    it "does not save the product if price is not numerical" do
      product = build(:product, price: "dwa")
      expect(product).not_to be_valid
    end
  end

  describe "#description" do
    it "validates presence of the description" do
      expect(product).to be_valid
    end

    it "does not save the product if the description has not been provided" do
      product = build(:product, description: nil) 
      expect(product).not_to be_valid
    end
  end 
end
