class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :lastname
  #has_many :recipes
end
