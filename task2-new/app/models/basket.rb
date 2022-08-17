class Basket < ApplicationRecord
  self.primary_key = "id"

  auto_increment :id
  has_many :apples
end
