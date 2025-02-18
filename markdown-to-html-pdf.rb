require_relative 'src/converter'
require_relative 'src/markdown_to_html'

if ARGV.length == 2
  input_file = ARGV[0]
  format = ARGV[1].downcase

  markdown_text = File.read(input_file)

  case format
  when 'html'
    html_output = convert_markdown_to_html(markdown_text)
    File.write("output.html", html_output)
    puts "HTML file saved as output.html"
  when 'pdf'
    convert_markdown_to_pdf(markdown_text, 'output.pdf')
    puts "PDF file saved as output.pdf"
  else
    puts "Invalid format. Please specify 'html' or 'pdf'."
  end
else
  puts "Usage: ruby markdown-to-html-pdf.rb [input_file] [html|pdf]"
end
