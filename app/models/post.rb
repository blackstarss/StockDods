class Post < ApplicationRecord
  
  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
  
end
