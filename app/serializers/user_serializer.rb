class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :name, :picture
end
