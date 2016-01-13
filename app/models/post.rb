class Post
  include Mongoid::Document
  field :content, type: String
  field :author_id, type: Integer
  field :publish_time, type: DateTime
  field :status, type: String

  
end
