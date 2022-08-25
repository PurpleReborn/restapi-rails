class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :qty, :price, :created_at, :updated_at, :order, :product
end
