class CreateUsersArticlesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :articles, :users do |t|
      t.index :article_id
      t.index :user_id
    end
  end
end
