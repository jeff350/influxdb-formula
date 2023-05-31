# frozen_string_literal: true

control 'InfluxDB configuration' do
  title 'should match desired lines'

  describe file('/etc/influxdb/config.toml') do
    # Default config
    its('content') { should include 'File managed by Salt at' }
    its('content') { should include 'bolt-path = "/var/lib/influxdb/influxd.bolt"' }
  end
end
