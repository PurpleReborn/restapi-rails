class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :description, :price
end
