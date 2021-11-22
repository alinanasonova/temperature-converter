class Converter
  def convert(value, scale, new_scale)
    return nil if scale == new_scale

    case scale
    when 'C'
      result = transform_from_c(value, new_scale)
    when 'K'
      result = transform_from_k(value, new_scale)
    when 'F'
      result = transform_from_f(value, new_scale)
    end
    result.round(2)
  end

  def transform_from_c(value, new_scale)
    case new_scale
    when 'K'
      value + 273.15
    when 'F'
      (value * 1.8) + 32
    end
  end

  def transform_from_k(value, new_scale)
    case new_scale
    when 'C'
      value - 273.15
    when 'F'
      (value * 1.8) - 459.67
    end
  end

  def transform_from_f(value, new_scale)
    case new_scale
    when 'C'
      (value - 32) / 1.8
    when 'K'
      (value + 459.67) / 1.8
    end
  end
end
