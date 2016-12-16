class EventException < ApplicationRecord
  belongs_to :event
  has_secure_token
end
