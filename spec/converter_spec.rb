require './lab1/converter'

RSpec.describe Converter do
  describe '#convert' do
    context '.C_to_F' do
      subject { Converter.new.convert(11, 'C', 'F') }
      it { is_expected.to eq 51.8 }
    end

    context '.C_to_K' do
      subject { Converter.new.convert(10, 'C', 'K') }
      it { is_expected.to eq 283.15 }
    end

    context '.F_to_C' do
      subject { Converter.new.convert(67, 'F', 'C') }
      it { is_expected.to eq(19.44) }
    end

    context '.F_to_K' do
      subject { Converter.new.convert(73, 'F', 'K') }
      it { is_expected.to eq(295.93) }
    end

    context '.K_to_C' do
      subject { Converter.new.convert(21, 'K', 'C') }
      it { is_expected.to eq(-252.15) }
    end

    context '.K_to_F' do
      subject { Converter.new.convert(412, 'K', 'F') }
      it { is_expected.to eq(281.93) }
    end

    context '.float_digit_input' do
      subject { Converter.new.convert(123.22, 'K', 'F') }
      it { is_expected.to eq(-237.87) }
    end
  end
end
