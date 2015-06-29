module ApplicationHelper
  
  def sortable(column, title=nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, {:sort => column , :direction => direction}
  end
  
  def username(id)
    u=User.find_by_id(id)
    u.first_name.capitalize + ' '+ u.last_name.capitalize
  end
end
