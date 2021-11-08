class IOAdapter

  def read_value
    loop do
      print 'enter temperature: '
      temperature = gets
      return temperature.to_f if (temperature.match(/^(?!-0$)[+-]?([1-9]\d*|0)(\.\d+)?$/))
      puts 'not a number, try again'
    end
  end
  
  def read_scale 
    loop do
      puts 'choose a scale [C, K, F]:'
      inpt = gets.chomp.upcase
      return inpt if (inpt.match(/^C$|^K$|^F$/))
      puts 'unknown scale, try again'
      #and inpt.size == 1
    end
  end

  def IO(value = read_value, scale = read_scale, new_scale = read_scale)
    if scale == new_scale
      abort('this is the same scale, try again')
    end
    conv = Converter.new
    result = conv.convert(value, scale, new_scale)
    puts "#{value}#{scale} = #{result}#{new_scale}"
  end
end