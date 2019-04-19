class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :donations, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :encrypted_password

end
