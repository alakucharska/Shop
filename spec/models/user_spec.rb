require 'rails_helper'

RSpec.describe User , type: :model do
  let!(:user) { build(:user) }

  describe "with valid parameters" do
    it " saves the user" do
      expect(user).to be_valid
      expect { user.save! }.to change { User.count }.by(1)
    end
  end

  describe "with invalid parameters" do
    describe "#name" do
      it "validates presence" do
        user = build(:user, name: nil)
        expect(user).not_to be_valid
      end

      it "validates length" do
        user = build(:user, name: "AlicjaK"*10)
        expect(user).not_to be_valid
      end
    end

    describe "#email" do
      it " validates presence" do
        user = build(:user, email: nil)
        expect(user).not_to be_valid
      end

      it "validates length" do
        user = build(:user, email: "alak@example.com"*250)
        expect(user).not_to be_valid
      end

      it "validates uniqueness" do
        user.save!
        user1 = User.new(name: "AlicjaK", email: "alicjak@foobar.com", password: "Alusia89")
        expect(user1).not_to be_valid
      end

      it "validates format" do
        invalid_email_address = %w[user.example.com @USERfoo.COM A_US-ER.foo.bar.org
                                first.last@]
          invalid_email_address.each do |email|
            user = build(:user, email: email)
            expect(user).not_to be_valid
          end
      end
    end

    describe "#password" do
      it "validates presence" do
        user = build(:user, password: nil)
        expect(user).not_to be_valid
      end

      it "validates minimum length" do
        user = build(:user, password: "ala" )
        expect(user).not_to be_valid
      end

      it "validates maximum length" do
        user = build(:user, password: "ala"*15 )
        expect(user).not_to be_valid
      end

      it "validates password confirmation" do
        user = build(:user, password_confirmation: "ala23")
        expect(user).not_to be_valid
      end
    end
  end
end
    
