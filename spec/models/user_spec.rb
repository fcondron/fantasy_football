require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end

  describe "admin attribute" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should respond to admin" do
      @user.should respond_to(:admin)
    end

    it "should not be an admin by default" do
      @user.should_not be_admin
    end

    it "should be convertible to an admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end

   describe "team associations" do

    before(:each) do
      @user = User.create(@attr)
    end

    it "should have a teams attribute" do
      @user.should respond_to(:teams)
    end

     it "should destroy associated teams" do
      @user.destroy
      [@mp1, @mp2].each do |team|
        Team.find_by_id(team.id).should be_nil
      end
    end
  end