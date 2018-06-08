class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {admin: 0, manager: 1, employee: 2}

  scope :admins, -> {User.where(role: 0)}
  scope :managers, -> {User.where(role: 1)}
  scope :employees, -> {User.where(role: 2)}

  belongs_to :pub, optional: true
end
