module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Fantasy Football"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def sortable(column, title=nil)
    title ||=column.titleize
    direction = column == sort_column && sort_direction =="asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def markdown(text)
   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
   markdown.render(text).html_safe
  end



    @my_blockquote = {
    'Quote' => [
      /\[quote\](.*?)\[\/quote\1?\]/mi,
      '<blockquote>\3</blockquote>',
      'Quote with citation',
      '[quote=mike]please quote me[/quote]',
      :quote
    ],
  }
end