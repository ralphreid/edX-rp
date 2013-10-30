module ApplicationHelper
  def sortable(column, title = nil, sort)
    title ||= column.titlesize
    direction =  sort == 'asc' ? 'desc' : 'asc'
    path = raw ["?", "column=", column, "&sort=", direction].join
    link_to title, path,  { :id => "#{column.underscore.downcase}_header" }
  end

end


  # :id => "#{title}_header"

# id: :title_header

# id: :release_date_header