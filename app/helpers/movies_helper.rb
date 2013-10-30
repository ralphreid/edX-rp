module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def custom_check_box_tag selected, rating
    ticked = selected.include?(rating)
    check_box_tag "ratings[#{rating}]", 1, ticked
  end
end
