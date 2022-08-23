class Order < ApplicationRecord
    has_many :products, dependent: :destroy

    has_one :user
end
