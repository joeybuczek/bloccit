module Paginate
  
  # paginate method needs to take a hash argument with 'per_page' and 'page' attributes
  # Example: @topics = Topic.paginate(page: params[:page], per_page: 10)
  
  def paginate(hash={})
    # pass these values to variables via 'hash[:key]'
    per_page = hash[:per_page] || 1
    page = hash[:page] || 1
    limit(per_page).offset((page - 1) * per_page)
  end
end