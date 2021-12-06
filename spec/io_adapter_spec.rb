require './lab1/io_adapter'

RSpec.describe IOAdapter do
  describe '#input_output' do
    context '.correct' do
      subject { capture_stdout { IOAdapter.new.input_output(34, 'C', 'K') } }
      it { is_expected.to eq "34C = 307.15K\n" }
    end
  end

  describe '#read_scale' do
    context '.correct' do
      subject { IOAdapter.new.read_scale('C') }
      it { is_expected.to eq 'C' }
    end
    context '.incorrect' do
      it "is expected to output 'unknown scale, try again'" do
        allow(described_class).to receive(:loop) do
          date = IOAdapter.new
          date.stub(:gets) { date.read_scale.inpt('dfe3') }
          expect(date.read_scale).to eq(puts('unknown scale, try again'))
        end
      end
    end
  end

  describe '#read_value' do
    context '.correct' do
      subject { IOAdapter.new.read_value('37') }
      it { is_expected.to eq 37 }
    end
    context '.incorrect' do
      it "is expected to output 'not a number, try again'" do
        allow(described_class).to receive(:loop) do
          date = IOAdapter.new
          date.stub(:gets) { date.read_value.temperature('33asd') }
          expect(date.read_value).to eq(puts('not a number, try again'))
        end
      end
    end
  end
end
