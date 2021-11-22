load 'lab1/io_adapter.rb'
load 'lab1/temperature.rb'
if __FILE__ == $0
  a = IOAdapter.new
  a.input_output
end