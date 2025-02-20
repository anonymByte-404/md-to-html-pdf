require 'kramdown'

def convert_markdown_to_html(markdown_text, format = 'html')
  if format == 'html'
    Kramdown::Document.new(markdown_text).to_html
  else
    return markdown_text
  end
end
