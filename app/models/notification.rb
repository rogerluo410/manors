class Notification
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :as_notified, type: Integer, default: 0
  field :as_read, type: Integer, default: 0
  field :title, type: String
  field :notify_type, type: Integer

  belongs_to :user

  default_scope ->{ where(as_read: 0, as_notified: 0).order(u_at: :desc) }
end
