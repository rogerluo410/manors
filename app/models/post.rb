class Post
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  field :content, type: String
  field :labels, type: Array
  field :author_id, type: Integer
  field :status, type: String, default: "active"

  default_scope ->{ where(status: "active").order(u_at: :desc) }

  has_many :replys, autosave: true
  embeds_many :images, cascade_callbacks: true
  
  accepts_nested_attributes_for :images

end
