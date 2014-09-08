class AddPicToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pic_file_name,    :string
    add_column :products, :pic_content_type, :string
    add_column :products, :pic_file_size,    :integer
    add_column :products, :pic_updated_at,   :datetime
  end
end
