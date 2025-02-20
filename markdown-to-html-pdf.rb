require_relative 'src/converter'
require_relative 'src/markdown_to_html'

def convert_markdown_to_pdf(markdown_text, output_file)
  puts "Initializing PDF document..."

  pdf = Prawn::Document.new

  markdown_text.each_line do |line|
    case line
    when /^# (.+)/
      pdf.move_down 10
      pdf.text $1, size: 24, style: :bold
    when /^## (.+)/
      pdf.move_down 8
      pdf.text $1, size: 18, style: :bold
    when /^### (.+)/
      pdf.move_down 6
      pdf.text $1, size: 16, style: :bold
    when /^\* (.+)/
      pdf.text "• #{$1}", size: 12
    when /^```ruby/
      pdf.move_down 5
      pdf.font("Courier")
    when /^```/
      pdf.font("Helvetica")
      pdf.move_down 5
    when /^> (.+)/
      pdf.move_down 5
      pdf.indent(20) { pdf.text $1, size: 12, style: :italic }
      pdf.move_down 5
    else
      pdf.text line.strip, size: 12
    end
  end

  puts "Saving the PDF as: #{output_file}"
  begin
    pdf.render_file(output_file)
    puts "PDF saved successfully!"
  rescue StandardError => e
    puts "Error saving PDF: #{e.message}"
  end
end

if ARGV.length == 2
  input_file = ARGV[0]
  format = ARGV[1].downcase

  if !File.exist?(input_file)
    puts "Error: Input file does not exist!"
    exit
  end

  markdown_text = File.read(input_file)

  case format
  when 'html'
    puts "Converting Markdown to HTML..."
    html_output = convert_markdown_to_html(markdown_text)
    File.write("output.html", html_output)
    puts "HTML file saved as output.html"
  when 'pdf'
    puts "Converting Markdown to PDF..."
    convert_markdown_to_pdf(markdown_text, "output.pdf")
  else
    puts "Invalid format. Please specify 'html' or 'pdf'."
  end
else
  puts "Usage: ruby markdown-to-html-pdf.rb [input_file] [html|pdf]"
end
