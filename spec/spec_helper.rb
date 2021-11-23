require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end
SimpleCov.minimum_coverage 90

module Kernel
  def capture_stdout(console_input = '')
    $stdin = StringIO.new
    $stdin.puts(console_input)
    $stdin.rewind
    out = StringIO.new
    $stdout = out
    yield
    out.string.strip
  ensure
    $stdout = STDOUT
    $stdin = STDIN
  end
end

module Helpers
  # Replace standard input with faked one StringIO.
  def fake_stdin(text)
    $stdin = StringIO.new
    $stdin.puts(text)
    $stdin.rewind
    yield
  ensure
    $stdin = STDIN
  end
end

module Stdouthelp
  def capture_stdout
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
    fake.string
  end
end

RSpec.configure do |conf|
  conf.include(Helpers)
  conf.include(Kernel)
  conf.include(Stdouthelp)
end
