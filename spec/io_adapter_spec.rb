require './lab1/temperature'
require './lab1/io_adapter'

require 'stringio'

module Kernel
  def capture_stdout(console_input = '')
    $stdin = StringIO.new(console_input)
    out = StringIO.new
    $stdout = out
    yield
    out.string.strip
  ensure
    $stdout = STDOUT
    $stdin = STDIN
  end
end

RSpec.describe IOAdapter do
  describe '#IO' do
    it "is expected to output 'this is the same scale, try again'" do
      expect do
        IOAdapter.new.input_output(34, 'C', 'C')
      rescue SystemExit
      end.to output("this is the same scale, try again\n").to_stderr
    end
  end

  describe '#read_value' do
    it "is expected to output 'not a number, try again'" do
      expect do
        input = '33a'
        result = capture_stdout(input) do
          IOAdapter.new.read_value
        rescue SystemExit
        end
      end.to output("not a number, try again\n").to_stderr
    end
  end

  describe '#read_scale' do
    it "is expected to output 'unknown scale, try again'" do
      expect do
        input = 'R'
        result = capture_stdout(input) do
          IOAdapter.new.read_scale
        rescue SystemExit
        end
      end.to output("unknown scale, try again\n").to_stderr
    end
  end
end
