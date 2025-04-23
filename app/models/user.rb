class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :payment
  accepts_nested_attributes_for :payment

  has_many :images

  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followed

  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower


  def full_name
    if name.present? || lastname.present?
      "#{name} #{lastname}"
    else
      "Anonymous"
    end
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
