class Product < ApplicationRecord
      has_one :order_detail
      # belongs_to :order
end
