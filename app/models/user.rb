class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :name, presence: true
  has_one :target_amount, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :items, dependent: :destroy
end
