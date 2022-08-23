class OrderSerializer < ActiveModel::Serializer
  attributes :id, :payment_method, :amount
  
end
