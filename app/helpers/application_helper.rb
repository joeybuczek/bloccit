module ApplicationHelper
  def my_name
    "JoeyB"
  end
  
  # Set CSS class for error visuals on form element if any occur
  def error_check_tag(errors)
    if errors.any?
      'has-error'
    end
  end
  
#   # Leaving the following method for future reference with passing a block
#   def form_group_tag(errors, &block)
#     if errors.any?
#       content_tag :div, capture(&block), class: 'form-group has-error'
#     else
#       content_tag :div, capture(&block), class: 'form-group'
#     end
#   end
  
#   # Markdown helper
#   def markdown(text)
#     renderer = Redcarpet::Render::HTML.new
#     extensions = {fenced_code_blocks: true}
#     redcarpet = Redcarpet::Markdown.new(renderer, extensions)
#     (redcarpet.render text).html_safe
#   end
  
end
