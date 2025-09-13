class CreateSocialMediaPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :social_media_posts do |t|
      t.references :topic, null: false, foreign_key: true
      t.string :platform
      t.string :platform_post_id
      t.text :content
      t.datetime :posted_at
      t.string :status

      t.timestamps
    end
  end
end
