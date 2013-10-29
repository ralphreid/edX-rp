module ApplicationHelper
  def sortable(column, title = nil, sort)
    title ||= column.titlesize
    #direction = (column == params[:sort] && params[:direction] == 'asc') ? 'desc' : 'asc'
    direction =  sort == 'asc' ? 'desc' : 'asc'

    #link_to title, :sort => column, :direction => direction
    path = raw ["?", "column=", column, "&sort=", direction].join
    link_to title, path,  { :id => "#{column.underscore.downcase}_header" }
    # ?column=title&order=asc|desc
  end

end


  # :id => "#{title}_header"

# id: :title_header

# id: :release_date_header