class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product
      t.string :user_id
      t.string :title
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
