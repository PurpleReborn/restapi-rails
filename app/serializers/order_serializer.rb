class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :date, :total,  :created_at, :updated_at, 

    def customer
    customer = object.try(:customer)

    return unless customer.present?
    {
      "id" => customer.id,
      "name" => customer.name
    }
    end

  
end
