class Post
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  field :content, type: String
  field :labels, type: Array
  field :author_id, type: Integer
  field :status, type: String, default: "active"

  default_scope ->{ where(status: "active").order(publish_time: :desc) }

  has_many :replys, autosave: true



  
end
