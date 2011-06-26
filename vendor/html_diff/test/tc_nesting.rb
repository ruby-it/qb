require File.join(File.dirname(__FILE__), 'test_helper')

class TestHTMLDiff < Test::Unit::TestCase

    def setup
      @old_file = fixture :old
      @new_file = fixture :new
      @right    = fixture :right
    end

    def test_proper_nesting
      assert_equal @right, HTMLDiff.diff(@old_file, @new_file)
    end

    private

      def fixture(file)
        IO.read(File.join(FixtureDir, "#{file}.html")).chomp
      end
end
