require 'test_helper'
require 'pdf_colored_pages'

class PdfColoredPagesTest < Test::Unit::TestCase

  TEST_PDF = "#{Dir.pwd}/test/combined.pdf"
  # in case there's no ghostscript on test machine run 'gs  -o - -sDEVICE=inkcov test/combined.pdf' and put output in here
  # MOCKED_GS_OUTPUT = ""

  def test_array
    # PdfColoredPages.stubs(:get_ghostscript_output).returns(MOCKED_GS_OUTPUT)
    assert_equal [1,3,4], PdfColoredPages.as_array(TEST_PDF)
  end

  def test_string_range
    assert_equal '1,3-4', PdfColoredPages.as_range_string(TEST_PDF)
  end

  def test_check
    assert PdfColoredPages.colored_pages?(TEST_PDF)
  end

  def test_404
    assert_raise( RuntimeError, "File '/tmp/preciousbodilyfluids.pdf' not found") do
      PdfColoredPages.colored_pages?('/tmp/preciousbodilyfluids.pdf')
    end
  end

end