class IOAdapter
  def read_value(temperature = nil)
    print 'enter temperature: '
    loop do
      temperature ||= gets
      return temperature.to_f if temperature&.match(/^(?!-0$)[+-]?([1-9]\d*|0)(\.\d+)?$/)

      puts 'not a number, try again'
    end
  end

  def read_scale(inpt = nil)
    puts 'choose a scale [C, K, F]:'
    loop do
      inpt ||= gets.chomp.upcase
      return inpt if inpt&.match(/^C$|^K$|^F$/)

      puts 'unknown scale, try again'
    end
  end

  def input_output(value = read_value, scale = read_scale, new_scale = read_scale)
    while scale == new_scale
      puts('this is the same scale, try again')
      new_scale = read_scale
    end
    conv = Converter.new
    result = conv.convert(value, scale, new_scale)
    puts "#{value}#{scale} = #{result}#{new_scale}"
  end
end
