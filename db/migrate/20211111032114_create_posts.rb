class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :member_id
      t.integer :genre_id
      t.string :title
      t.text :article
      t.text :tags
      t.string :link
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
