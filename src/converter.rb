require_relative 'markdown_to_html'

def convert_markdown_to_pdf(markdown_text, output_file)
  pdf = Prawn::Document.new
  pdf.text markdown_text, size: 12
  pdf.render_file(output_file)
end
