require_relative 'src/converter'
require_relative 'src/markdown_to_html'

class MarkdownConverter
  # Initializes a new MarkdownConverter instance.
  #
  # @param input_file [String] The path to the Markdown input file.
  # @param format [String] The desired output format ('html' or 'pdf').
  def initialize(input_file, format)
    @input_file = input_file
    @format = format.downcase
    validate_input_file
    @markdown_text = File.read(@input_file)
  end

  # Converts the Markdown text to the specified format (HTML or PDF).
  def convert
    case @format
    when 'html'
      convert_to_html
    when 'pdf'
      convert_to_pdf
    else
      puts "Invalid format. Please specify 'html' or 'pdf'."
    end
  end

  private

  # Validates the input file's existence.
  def validate_input_file
    unless File.exist?(@input_file)
      puts "Error: Input file does not exist!"
      exit
    end
  end

  # Converts Markdown text to HTML and saves it to a file.
  def convert_to_html
    puts "Converting Markdown to HTML..."
    html_output = convert_markdown_to_html(@markdown_text)
    output_file = generate_output_filename("html")
    File.write(output_file, html_output)
    puts "HTML file saved as #{output_file}"
  end

  # Converts Markdown text to PDF and saves it to a file.
  def convert_to_pdf
    puts "Converting Markdown to PDF..."
    output_file = generate_output_filename("pdf")
    convert_markdown_to_pdf(@markdown_text, output_file)
  end

  # Generates an output filename based on the input file name and the desired format.
  #
  # @param extension [String] The desired output file extension ('html' or 'pdf').
  # @return [String] The generated output filename.
  def generate_output_filename(extension)
    base_name = File.basename(@input_file, ".*")
    "#{base_name}.#{extension}"
  end
end

if ARGV.length == 2
  input_file = ARGV[0]
  format = ARGV[1]

  converter = MarkdownConverter.new(input_file, format)
  converter.convert
else
  puts "Usage: ruby markdown-to-html-pdf.rb [input_file] [html|pdf]"
end
