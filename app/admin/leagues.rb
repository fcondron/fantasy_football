ActiveAdmin.register League do
  menu :label => "Leagues", :parent => "Game Admin"


  index do
    column :id
    column :name
    column :created_at
    default_actions
  end

   form do |f|
     f.inputs "Table details" do
     f.input :name
     end
     f.buttons
   end
end
