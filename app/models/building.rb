class Building < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :prefecture, presence: true
  validates :buildings_name, presence: true
  validates :address, presence: true
  validates :completion, presence: true
  validates :image, presence: true
end
