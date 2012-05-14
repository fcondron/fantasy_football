require 'spec_helper'

describe TeamsController do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :content => "" }
      end

      it "should not create a team" do
        lambda do
          post :create, :team => @attr
        end.should_not change(Team, :count)
      end

      it "should render the home page" do
        post :create, :team => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :content => "Lorem ipsum" }
      end

      it "should create a team" do
        lambda do
          post :create, :team => @attr
        end.should change(Team, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :team => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :team => @attr
        flash[:success].should =~ /team created/i
      end
    end
  end

   describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @team = Factory(:team, :user => @user)
      end

      it "should deny access" do
        delete :destroy, :id => @team
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @team = Factory(:team, :user => @user)
      end

      it "should destroy the team" do
        lambda do
          delete :destroy, :id => @team
        end.should change(Team, :count).by(-1)
      end
    end
   end

  describe "GET 'edit'" do

    it "should be successful" do
      get :edit, :id => @team
      response.should be_success
    end
  end

   describe "PUT 'update'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end

    describe "failure" do

      before(:each) do
        @attr = { :email => "", :name => "", :password => "",
                  :password_confirmation => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @user, :user => @attr
        response.should render_template('edit')
      end

      it "should have the right title" do
        put :update, :id => @user, :user => @attr
        response.should have_selector("title", :content => "Edit user")
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :content => "content", :team_name => "team_name",
                  :points => 0}
      end

      it "should change the team's attributes" do
        put :update, :id => @team, :team => @attr
        @team.reload
        @team.points.should  == @attr[:points]
        @team.team_name.should == @attr[:team_name]
      end

      it "should redirect to the teams show page" do
        put :update, :id => @team, :team => @attr
        response.should redirect_to(teams_path)
      end

      it "should have a flash message" do
        put :update, :id => @team, :team => @attr
        flash[:success].should =~ /updated/
      end
    end

     describe "authentication of edit/update pages" do

    before(:each) do
      @team = Factory(:team)
    end

    describe "for non-signed-in users" do

      it "should deny access to 'edit'" do
        get :edit, :id => @user
        response.should redirect_to(signin_path)
      end

      it "should deny access to 'update'" do
        put :update, :id => @user, :user => {}
        response.should redirect_to(signin_path)
      end
    end
   end
  end
end