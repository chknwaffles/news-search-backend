class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :source, :author, :title, :description, :url, :urlImage, :publishedAt, :content

  belongs_to :user
end
