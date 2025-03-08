require 'kramdown'

# Converts Markdown text to HTML format using Kramdown.
#
# @param markdown_text [String] The Markdown text to be converted.
# @param format [Symbol] The desired output format (currently only :html is supported).
# @return [String] The converted HTML or the original Markdown if the format is not supported.
def convert_markdown_to_html(markdown_text, format = :html)
  begin
    case format
    when :html
      Kramdown::Document.new(markdown_text).to_html
    else
      puts "Warning: Unsupported format '#{format}'. Returning original markdown text."
      markdown_text
    end
  rescue StandardError => e
    puts "Error during conversion: #{e.message}"
    markdown_text # Return original text in case of error
  end
end
