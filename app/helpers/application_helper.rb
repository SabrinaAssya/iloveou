module ApplicationHelper
  def category_fa_class(category)
    case category
    when "Restaurant"
      'fa-utensils'
    when "Culture"
      'fa-masks-theater'
    when "Drinks"
      'fa-champagne-glasses'
    when "Outdoor"
      'fa-tree-city'
    when "Original"
      'fa-solid fa-face-grin-stars"'
    else
      'fa-question'
    end
  end
end
