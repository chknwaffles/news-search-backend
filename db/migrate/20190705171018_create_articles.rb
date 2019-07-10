class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :topic
      t.string :source
      t.string :author
      t.string :title
      t.text :description
      t.string :url
      t.string :urlImage
      t.string :publishedAt
      t.text :content
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.timestamps
    end
  end
end
