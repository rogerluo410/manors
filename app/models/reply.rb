class Reply
  include Mongoid::Document
  field :content, type: String
  field :author_id, type: Integer
  field :reply_time, type: DateTime, default: ->{ Time.now }
  field :status, type: String, default: "active"

  default_scope ->{ where(status: "active").order(reply_time: :asc) }

  belongs_to :post


end
