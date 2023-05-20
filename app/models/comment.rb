class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :building

  validates :content, presence: true
end
