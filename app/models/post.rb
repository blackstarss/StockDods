class Post < ApplicationRecord

  belongs_to :genre
  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_hashtags
  has_many :hashtags, through: :post_hashtags

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

  after_create do
    post = Post.find_by(id: id)
    hashtags  = tags.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
    tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
    post.hashtags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.hashtags.clear
    hashtags = hashtags.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
    tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
    post.hashtags << tag

    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content).or(Post.where(article: content))
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%').or(Post.where('article LIKE ?', content+'%'))
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content).or(Post.where('article LIKE ?', '%'+content))
    else
      Post.where('title LIKE ?', '%'+content+'%').or(Post.where('article LIKE ?', '%'+content+'%'))
    end
  end

end
