ActiveAdmin.register User do
  menu :label => "Regular Users", :parent => "User Admin", :priority => 2

  index do
    column :username
    column :email
    column :last_sign_in_at
    column :last_sign_in_ip
  default_actions
  end

     form do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :forem_admin
    end
    f.buttons
  end
end
