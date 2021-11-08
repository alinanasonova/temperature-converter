require './lab1/temperature'
require './lab1/io_adapter'

RSpec.describe Converter do
  describe '#CF' do 
    subject { Converter.new.convert(11, 'C', 'F') }
      it { is_expected.to eq 51.8}
  end
  describe '#CK' do 
    subject { Converter.new.convert(10, 'C', 'K') }
      it { is_expected.to eq 283.15 }
  end
  describe '#FC' do 
    subject { Converter.new.convert(67, 'F', 'C') }
      it { is_expected.to eq(19.44) }
  end
  describe '#FK' do 
    subject { Converter.new.convert(73, 'F', 'K') }
      it { is_expected.to eq(295.93) }
  end
  describe '#KC' do 
    subject { Converter.new.convert(21, 'K', 'C') }
      it { is_expected.to eq(-252.15) }
  end
  describe '#KF' do 
    subject { Converter.new.convert(412, 'K', 'F') }
      it { is_expected.to eq(281.93) }
  end
  describe '#float digit' do 
    subject { Converter.new.convert(123.22, 'K', 'F') }
      it { is_expected.to eq(-237.87) }
  end
end

RSpec.describe IOAdapter do
  describe '#IO' do 
    it "is expected to output 'this is the same scale, try again'" do
      expect {
        begin IOAdapter.new.IO(34, 'C', 'C')
        rescue SystemExit
        end
      }.to output("this is the same scale, try again\n").to_stderr
    end
  end
end
