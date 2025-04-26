class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email

  attribute :stats do |obj|
    obj.stats
  end
end
