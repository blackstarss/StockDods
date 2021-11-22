class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
   
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
  has_many :followings, through: :relationships, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人
  
  def follow(member_id)
    relationships.create(followed_id: member_id)
  end
  
  def unfollow(member_id)
    relationships.find_by(followed_id: member_id).destroy
  end
  
  def following?(member)
    followings.include?(member)
  end
   
   attachment :image
   
  def self.search_for(content, method)
    if method == 'perfect'
      Member.where(name: content)
    elsif method == 'forward'
      Member.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Member.where('name LIKE ?', '%' + content)
    else
      Member.where('name LIKE ?', '%' + content + '%')
    end
  end
         
         
end
