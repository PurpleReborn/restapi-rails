class Status < ApplicationRecord
    has_one :user, dependent: :destroy
end
