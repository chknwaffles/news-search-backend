class ArticleSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :source, :author, :title, :description, :url, :urlImage, :publishedAt, :content
end
