require 'kramdown'

def convert_markdown_to_html(markdown_text)
  Kramdown::Document.new(markdown_text).to_html
end
