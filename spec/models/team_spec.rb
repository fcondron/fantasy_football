require 'spec_helper'

describe Team do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.teams.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @team = @user.teams.create(@attr)
    end

    it "should have a user attribute" do
      @team.should respond_to(:user)
    end

    it "should have the right associated user" do
      @team.user_id.should == @user.id
      @team.user.should == @user
    end
  end

  describe "validations" do

    it "should require a user id" do
      Team.new(@attr).should_not be_valid
    end
  end
end
