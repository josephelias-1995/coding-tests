# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

50.times do
  Basket.create(capacity: Random.new.rand(2..27), fill_rate: '0') if Basket.count < 50
end
