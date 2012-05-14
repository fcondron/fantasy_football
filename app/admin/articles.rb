ActiveAdmin.register Article do
  menu :label => "Blog", :parent => "Site Admin"



  index do
    column :author
    column :headline
    column :description
    default_actions
  end

      form do |f|
    f.inputs "Article Details" do
      f.input :author
      f.input :headline
      f.input :description
      f.input :content, :as => 'text'
    end
    f.buttons
      end


end
