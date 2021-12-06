require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end
SimpleCov.minimum_coverage 90

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
  #def capture_stdout(console_input = '')
  #  $stdin = StringIO.new(console_input)
  #  out = StringIO.new
  #  $stdout = out
  #  yield
  #  out.string.strip
  #ensure
  #  $stdout = STDOUT
  #  $stdin = STDIN
  #end
end

RSpec.configure do |conf|
  conf.include(Stdouthelp)
end
