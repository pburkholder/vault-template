require 'inspec'

describe file('/etc/passwd') do
  it { should exist }
  it { should be_file }
end
