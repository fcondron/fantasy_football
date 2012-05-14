ActiveAdmin::Dashboards.build do

  section "Site Controls", :priority => 1 do
    ul do
      li link_to "View Site", "/"
      li link_to "Zero Team Points", zeroTeamPoints_admin_teams_path, :confirm => "are you sure?"
      li link_to "update Team Points", updateTeamPoints_admin_teams_path, :confirm => "are you sure?"
      li link_to "Zero Player Points", zeroPlayerPoints_admin_players_path, :confirm => "are you sure?"
      li link_to "update Player Points", updatePlayerPoints_admin_players_path, :confirm => "are you sure?"
      li link_to "Update Player Attributes", updateAttributes_admin_players_path
      li link_to "Create Back Players", createBackPlayer_admin_players_path
      li link_to "Create Forward Players", createForwardPlayer_admin_players_path
      li link_to "Delete Players", deletePlayers_admin_players_path
      li link_to "Create Sample Players", samplePlayer_admin_players_path
      li "Time is #{Time.now}"
    end
  end

  section "Recent Articles" do
    ul do
      Article.last(5).collect do |article|
        li link_to("'#{article.headline}' posted by, #{article.author}, posted #{time_ago_in_words(article.created_at)}", admin_article_path(article))
      end
    end
  end

  section "Recent Users" do
    ul do
      User.last(10).collect do |user|
        li link_to("#{user.username}, signed in #{time_ago_in_words(user.last_sign_in_at)} ago", admin_user_path(user) )
      end
    end
  end




  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
