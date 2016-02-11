require 'inspec'

describe file('/etc/s3cfg') do
  it { should exist }
  it { should be_file }
end
