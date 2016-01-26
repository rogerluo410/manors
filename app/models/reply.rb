class Reply
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  field :content, type: String
  field :author_id, type: Integer
  field :status, type: String, default: "active"

  default_scope ->{ where(status: "active").order(reply_time: :asc) }

  belongs_to :post


end
