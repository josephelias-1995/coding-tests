class Apple < ApplicationRecord
  self.primary_key = "id"

  auto_increment :id
  belongs_to :basket

end
