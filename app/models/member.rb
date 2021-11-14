class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
   has_many :posts, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :comments, dependent: :destroy
   
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
