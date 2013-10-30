module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def sortable(column, title = nil, sort)
    title ||= column.titlesize
    direction =  sort == 'asc' ? 'desc' : 'asc'
    path = raw ["?", "column=", column, "&sort=", direction].join
    link_to title, path,  { :id => "#{column.underscore.downcase}_header" }
  end

  def custom_check_box_tag selected, rating
    ticked = selected.include?(rating)
    check_box_tag "ratings[#{rating}]", 1, ticked
  end
end
