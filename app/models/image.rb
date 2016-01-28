class Image
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  mount_uploader :avatar, AvatarUploader
  field :status, type: String, default: "active"
  default_scope ->{ where(status: "active").order(u_at: :asc) }

  embedded_in :post
end
