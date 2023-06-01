# frozen_string_literal: true

control 'InfluxDB package' do
  title 'should be installed'

  describe package('influxdb2') do
    it { should be_installed }
  end
end
