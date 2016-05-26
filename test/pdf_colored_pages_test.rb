require 'test/unit'
require 'pdf_colored_pages'

class PdfColoredPagesTest < Test::Unit::TestCase

  TEST_PDF = "#{Dir.pwd}/test/combined.pdf"

  def test_array
    assert_equal [1,3,4], PdfColoredPages.as_array(TEST_PDF)
  end

  def test_string_range
    assert_equal '1,3-4', PdfColoredPages.as_range_string(TEST_PDF)
  end

  def test_check
    assert PdfColoredPages.as_range_string(TEST_PDF)
  end

end