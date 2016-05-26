require "pdf_colored_pages/version"

module PdfColoredPages
  def self.as_range_string (pdf_file)
    gsp = get_ghostscript_output(pdf_file)
    gsp.colored_pages_range_string
  end

  def self.as_array(pdf_file)
    gsp = get_ghostscript_output(pdf_file)
    gsp.colored_pages
  end

  def self.colored_pages?(pdf_file)
    gsp = get_ghostscript_output(pdf_file)
    gsp.colored_pages?
  end

  def self.get_ghostscript_output(pdf_file)
    unless File.exist? pdf_file
      # throw error
    end
    gs_output = `gs  -o - -sDEVICE=inkcov #{pdf_file}`
    GhostScriptParser.new gs_output
  end
end

class PdfColoredPages::GhostScriptParser
  def initialize(gs_output)
    # Instance variables
    @gs_output = gs_output
    @colored_pages = []
  end

  def colored_pages
    if @colored_pages.length==0
      current_page = 0
      @gs_output.each_line do |line|
        page_line = line.match(/Page [0-9]+/)
        if page_line
          current_page = page_line.to_s.split(' ').last.to_i
        elsif current_page > 0 and line.start_with? ' '
          # 0.05803  0.05803  0.05803  0.00000 CMYK OK
          parts = line.scan(/(\d[.]\d+)/)
          # first three equal is grey! ignore key (black)
          unless (parts.first == parts[1]) and (parts.first == parts[2])
            # first C,M,Y are different, colored page
            @colored_pages.push current_page.to_i
          end
        end
      end
    end
    @colored_pages
  end

  def colored_pages?
    colored_pages.length > 0
  end

  # e.g. 1,3-4
  def colored_pages_range_string
    output = []
    colored_pages # load pages

    # parse 'em
    RangeArray.new(@colored_pages).to_ranges.each do |range|

      range_array = range.to_a
      if range_array.length > 1
        output.push "#{range_array.first}-#{range_array.last}"
      else
        output.push range_array.first.to_s
      end
    end
    output.join(',')
  end

  class RangeArray < Array
    def to_ranges
      compact.sort.uniq.inject([]) do |r, x|
        r.empty? || r.last.last.succ != x ? r << (x..x) : r[0..-2] << (r.last.first..x)
      end
    end
  end

end
