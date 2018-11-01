require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  it { is_expected.to respond_to(:report_broken) }

  it 'reports a bike as broken' do
    expect(subject.report_broken).to eq subject.broken?
  end

end
