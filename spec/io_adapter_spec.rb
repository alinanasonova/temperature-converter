require './lab1/io_adapter'
require './lab1/converter'

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
  end

  describe '#read_value' do
    context '.correct' do
      subject { IOAdapter.new.read_value('37') }
      it { is_expected.to eq 37 }
    end
  end

  describe '#read_value' do
    context '.stay_in_one_state' do
      $stdin = StringIO.new
      $stdin.puts("34\n")
      $stdin.rewind
      subject { capture_stdout { IOAdapter.new.read_value('37c') } }
      it { is_expected.to eq "enter temperature: not a number, try again\nenter temperature: " }
    end
  end
end
