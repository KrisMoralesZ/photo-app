class Payment < ApplicationRecord
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user

  validates :token, presence: true
  validates :email, presence: true

  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a
  end

  def process_payment
    customer = Stripe::Customer.create({ email: email, source: token })

    Stripe::Charge.create(customer: customer.id, amount: 1000, description: 'Premium', currency: 'usd')

  rescue Exception => e
    Rails.logger.error "Stripe Error: #{e.class} - #{e.message}"
    flash[:error] = "Payment error: #{e.message}"
    resource.destroy
    render :new and return
  end

end
