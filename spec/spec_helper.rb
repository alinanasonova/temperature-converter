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
end

RSpec.configure do |conf|
  conf.include(Stdouthelp)
end
