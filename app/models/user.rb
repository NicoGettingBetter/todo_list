class User < ActiveRecord::Base
  has_many :lists

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
