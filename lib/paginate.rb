module Paginate
  
#   paginate method needs to take a hash argument with 'per_page' and 'page' attributes
#   Example: @topics = Topic.paginate(page: params[:page], per_page: 10)
  
  def paginate(hash={})
    
    # pass these values to variables via 'hash[:key]'
    per_page = hash[:per_page]
    page = hash[:page]
    
    # calculate total number of pages: count / per_page, rounded up
    total_pages = (count.to_f / per_page.to_f).ceil
    
    # create the collections for each page (via limit/offset methods) and store them in an array
    array = []
    for page_num in 0..(total_pages - 1) do
      array << limit(per_page).offset(page_num * per_page)
    end
    
    # create return value for this method
    { items: array, pages: total_pages }
    
  end
  
end