class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :tags,  length: { maximum: 10 }
end
