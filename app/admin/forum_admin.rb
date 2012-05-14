ActiveAdmin.register_page "Forum Admin" do
  content do
    section "Recent Topics" do
      ul do
        Topic.last(5).collect do |topic|
          li link_to("'#{topic.title}' posted by, #{topic.user.username} in '#{topic.forum.title}', posted #{time_ago_in_words(topic.created_at)}", topic_path(topic))
        end
      end
    end

    section "Recent Posts" do
      ul do
        Post.last(5).collect do |post|
          li link_to("'#{post.body.first(100)}' posted by, #{post.user.username}, posted #{time_ago_in_words(post.created_at)}", post_path(post))
        end
      end
    end
  end
end