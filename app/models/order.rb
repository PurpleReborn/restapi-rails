class Order < ApplicationRecord
    extend Enumerize
    # has_many :products, dependent: :destroy
    belongs_to :customer
    has_one :order_detail
    # has_one :customer, dependent: :destroy

    enumerize :status, in: %i[paid pending cancle], default: :pending
    
end
