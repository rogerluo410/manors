class Post
  include Mongoid::Document
  field :content, type: String
  field :labels, type: Array
  field :author_id, type: Integer
  field :publish_time, type: DateTime, default: ->{ Time.now }
  field :status, type: String, default: "active"

  default_scope ->{ where(status: "active").order(publish_time: :desc) }

  has_many :replys



  
end
