ActiveAdmin.register Category do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  permit_params [:category_id , :name , :id , :title]
  index do
    column :id
    column :category_id
    column :name
    column "Created At" , :created_at
    actions

  end
  show do |content|
    attributes_table do
      h4 category.name
      h4 category.id
      h4 category.created_at.to_s(:long)
      hr
      h3 "List of Products in  #{category.name}"
   @products= Product.where(:category_id =>  category.id)
   @products.each do |prod|
      h4 link_to prod.title , admin_product_path(prod.id)
       end
     end
  end

end

