class CreateOranges < ActiveRecord::Migration[7.0]
  def change
    create_table :oranges do |t|
      t.string :name

      t.timestamps
    end
  end
end
