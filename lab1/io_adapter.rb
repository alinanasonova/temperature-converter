class IOAdapter

  def read_value
    print 'enter temperature: '
      temperature = gets
    return temperature.to_f if (temperature.match(/^(?!-0$)[+-]?([1-9]\d*|0)(\.\d+)?$/))
    abort('not a number, try again')
  end
  
  def read_scale 
    puts 'choose a scale [C, K, F]:'
    inpt = gets.chomp.upcase
    return inpt if (inpt.match(/^C$|^K$|^F$/))
    abort('unknown scale, try again')
    #and inpt.size == 1
  end

  def input_output(value = read_value, scale = read_scale, new_scale = read_scale)
    if scale == new_scale
      abort('this is the same scale, try again')
    end
    conv = Converter.new
    result = conv.convert(value, scale, new_scale)
    puts "#{value}#{scale} = #{result}#{new_scale}"
  end
end