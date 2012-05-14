ActiveAdmin.register_page "User Admin" do
  content do
    para "Number of Users: #{User.count}"
    para "Number of Admin Users: #{AdminUser.count}"
  end
end