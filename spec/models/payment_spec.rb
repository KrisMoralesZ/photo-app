# spec/models/payment_spec.rb

require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { User.create(email: "test@test.com", password: "password") }

  it "is valid with valid attributes" do
    payment = Payment.new(
      email: user.email,
      token: "intok_1MzDbE2eZvKYlo2C26a98MDg",
      user: user
    )
    expect(payment).to be_valid
  end

  it "is invalid without a token" do
    payment = Payment.new(email: user.email, user: user)
    expect(payment).to_not be_valid
  end
end

