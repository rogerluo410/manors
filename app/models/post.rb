class Post
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  include Mongoid::Search
  field :content, type: String
  field :labels, type: Array
  field :author_id, type: Integer
  field :status, type: String, default: "active"
  index({content: "text" })

  default_scope ->{ where(status: "active").order(u_at: :desc) }

  has_many :replys, autosave: true
  embeds_many :images, cascade_callbacks: true
  
  accepts_nested_attributes_for :images

  search_in :content
  PER_PAGE = 8

  def initialize_post_meta
    @post_meta = Redis::HashKey.new("#{Post.name}:#{self.id.to_s}")
    @post_meta["ups"] = 0
    @post_meta["views"] = 0
    @post_meta["replys"] = 0
  end

  def get_post_meta(key)
    @post_meta ||= Redis::HashKey.new("#{Post.name}:#{self.id.to_s}")
    @post_meta.fetch(key.to_s) do | key |
      @post_meta[key] = 0
    end
  end

  def set_post_meta(key)
    @post_meta ||= Redis::HashKey.new("#{Post.name}:#{self.id.to_s}")
    @post_meta["ups"] ||= 0
    @post_meta["views"] ||= 0
    @post_meta["replys"] ||= 0
    @post_meta.incr('ups', 1) if key == "ups"
    @post_meta.incr('views', 1) if key == "views"
    @post_meta.incr('replys', 1) if key == "replys"
  end

end
