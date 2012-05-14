ActiveAdmin.register_page "Site Admin" do
  content do
    para "Current Articles"
     Article.last(5).collect do |article|
        li link_to("'#{article.headline}' posted by, #{article.author}, posted #{time_ago_in_words(article.created_at)}", admin_article_path(article))
     end
  end
end