class CreatePostHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_hashtags do |t|
      t.bigint :post, limit: 20
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
    add_foreign_key :post_hashtags, :posts
  end
end
