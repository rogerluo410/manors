class User
  include Mongoid::Document
  field :name, type: String
  field :password, type: String
  field :salt, type: String
  field :role, type: Array
end
