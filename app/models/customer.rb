class Customer < ApplicationRecord
      # belongs_to :order
        has_one :customer
end
