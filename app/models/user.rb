class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :registerable, :timeoutable

         
         validates :name, presence: true
         validates :department, presence: true

         has_many :buildings
         has_many :comments ,dependent: :destroy
        end
