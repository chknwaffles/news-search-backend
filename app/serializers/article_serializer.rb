class ArticleSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :source, :author, :title, :description, :url, :urlImage, :publishedAt, :content
end
