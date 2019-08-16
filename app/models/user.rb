class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :audit_logs
  PHONE_REGEX = /\A[0-9]*\z/
  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :phone,  presence: true
  validates :phone,  length: {is: 9 }
  validates_format_of :phone, with: PHONE_REGEX
  
  def full_name
    last_name + ", " + first_name
  end
end
