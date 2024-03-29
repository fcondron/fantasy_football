require 'spec_helper'

describe "roles/index.html.erb.erb" do
  before(:each) do
    assign(:roles, [
      stub_model(Role,
        :name => "Name"
      ),
      stub_model(Role,
        :name => "Name"
      )
    ])
  end

  it "renders a list of roles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
