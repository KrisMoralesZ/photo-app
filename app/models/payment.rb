class Payment < ApplicationRecord
  attr_accessor :card_number
  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map do |name, index|
    end
  end

end
