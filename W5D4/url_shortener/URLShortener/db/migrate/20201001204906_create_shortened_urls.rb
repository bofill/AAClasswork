class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, unique: true
      t.string :long_url
      t.integer :user_id, null: false
      t.index :user_id
      t.index :short_url
      t.timestamps
    end
  end
end
