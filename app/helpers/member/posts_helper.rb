module Member::PostsHelper
  def render_with_hashtags(hashtags)
    hashtags.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/hashtags/hashtag/#{word.delete("#")}" }.html_safe
  end
end
