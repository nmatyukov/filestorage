class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable

  has_many :documents

  validates :email,    email: true
  validates :email,    presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false
  validates_uniqueness_of :email
end
