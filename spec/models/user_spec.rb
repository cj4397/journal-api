require 'rails_helper'

RSpec.describe User, type: :model do

let(:user) {
    User.create(email: "user_email.com",
             password: "password")
  }


    context " encrypt password" do
    it "password must be encrypted" do
      expect(user.encrypt_password(user.password)).to_not be 'password'
    end
  end

  context "Generate token" do
    it "Generates 32 characters token using email as base" do
      expect(user.generate_token(user.email)).to_not be eql("user_email.com")
    end
  end

end