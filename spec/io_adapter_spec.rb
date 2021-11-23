require './lab1/io_adapter'
require './lab1/converter'
require 'active_support'
require 'stringio'

RSpec.describe IOAdapter do
  describe '#input_output_ok' do
    subject { capture_stdout { IOAdapter.new.input_output(34, 'C', 'K') } }
    it { is_expected.to eq "34C = 307.15K\n" }
  end

  describe '#read_scale_ok' do
    subject { IOAdapter.new.read_scale('C') }
    it { is_expected.to eq 'C' }
  end

  describe '#read_value_ok' do
    subject { IOAdapter.new.read_value('37') }
    it { is_expected.to eq 37 }
  end

  # describe '#read_value_error' do
  #  subject { capture_stdout { IOAdapter.new.read_value("37c") } }
  #  it { is_expected.to eq "enter temperature: not a number, try again\n" }
  # end
end
