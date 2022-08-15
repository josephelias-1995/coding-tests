class AddBasketToApple < ActiveRecord::Migration[7.0]
  def change
    add_reference :apples, :basket, null: false, foreign_key: true
  end
end
