ActiveAdmin.register Product do



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

  filter :category, :as => :select, :collection => lambda{ Category.all }
  permit_params [:category_id, :id , :product , :price , :created_at , :title , :description , :pic , :brand_name]


  index do
    column :id
    column :product
    column :price
    column "Created At" , :created_at

    actions
  end

  form do |f|
    f.inputs "New Product" do
      f.input :category
      f.input :brands
      f.input :title
      f.input :product
      f.input :price
      f.input :description
      f.input :pic , as: :file
      end
    f.actions
 end

  show do |content|
    attributes_table do
      h4 product.title
      h4 product.category_id
      h4 product.price
      h5 product.created_at.to_s(:long)

      div  do
      h4  simple_format product.description
      end
      div  do
        image_tag(content.pic.url)
      end
      active_admin_comments
      end
    end

end
