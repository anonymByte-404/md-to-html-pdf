require 'prawn'
require 'prawn/table'
require_relative 'markdown_to_html'

class MarkdownToPdfConverter
  # Initializes a new MarkdownToPdfConverter instance.
  #
  # @param markdown_text [String] The Markdown text to be converted to PDF.
  # @param output_file [String] The path where the output PDF file will be saved.
  def initialize(markdown_text, output_file)
    @markdown_text = markdown_text
    @output_file = output_file
    @pdf = Prawn::Document.new
  end

  # Converts the Markdown text to a PDF document.
  def convert
    puts "Initializing PDF document..."
    process_markdown
    save_pdf
  end

  private

  # Processes the Markdown text line by line and adds the corresponding elements to the PDF.
  def process_markdown
    @markdown_text.each_line do |line|
      case line
      when /^# (.+)/
        add_heading($1, 24)
      when /^## (.+)/
        add_heading($1, 18)
      when /^### (.+)/
        add_heading($1, 16)
      when /^\* (.+)/
        add_list_item($1)
      when /^```ruby/
        start_code_block
      when /^```/
        end_code_block
      when /^> (.+)/
        add_block_quote($1)
      else
        add_paragraph(line.strip)
      end
    end
  end

  # Adds a heading to the PDF with the specified text and size.
  #
  # @param text [String] The heading text to add.
  # @param size [Integer] The font size of the heading.
  def add_heading(text, size)
    @pdf.move_down 10
    @pdf.text text, size: size, style: :bold
  end

  # Adds a list item to the PDF.
  #
  # @param text [String] The list item text to add.
  def add_list_item(text)
    @pdf.text "• #{text}", size: 12
  end

  # Starts a code block in the PDF with a monospace font.
  def start_code_block
    @pdf.move_down 5
    @pdf.font("Courier")
  end

  # Ends the code block and resets the font to Helvetica.
  def end_code_block
    @pdf.font("Helvetica")
    @pdf.move_down 5
  end

  # Adds a block quote to the PDF.
  #
  # @param text [String] The quote text to add.
  def add_block_quote(text)
    @pdf.move_down 5
    @pdf.indent(20) { @pdf.text text, size: 12, style: :italic }
    @pdf.move_down 5
  end

  # Adds a paragraph to the PDF.
  #
  # @param text [String] The paragraph text to add.
  def add_paragraph(text)
    @pdf.text text, size: 12
  end

  # Saves the PDF document to the specified output file.
  def save_pdf
    puts "Saving the PDF as: #{@output_file}"
    begin
      @pdf.render_file(@output_file)
      puts "PDF saved successfully!"
    rescue StandardError => e
      puts "Error saving PDF: #{e.message}"
    end
  end
end
