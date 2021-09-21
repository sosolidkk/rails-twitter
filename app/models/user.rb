class User < ApplicationRecord
  has_many :tweets

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
    :rememberable, :validatable
  acts_as_voter
end
