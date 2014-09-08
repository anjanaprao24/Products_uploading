class AddProductIdToBrands < ActiveRecord::Migration
  def change
    add_column :brands , :product_id , :integer
  end
end
