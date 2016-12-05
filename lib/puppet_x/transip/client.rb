require 'yaml'
#require 'transip'

module Transip
  CREDENTIALS_FILE = '/etc/transip/credentials'
  class Client
    def self.credentials
      @@credentials ||= YAML.load_file(CREDENTIALS_FILE)
    end

    def self.domainclient
      @@domainclient ||= Transip::DomainClient.new(username: credentials['username'], key_file: credentials['key_file'], ip: credentials['ip'], mode: :readwrite)
    end

    def self.get_domain_names
      domainclient.request(:get_domain_names)
    end

    def self.get_entries(domain)
      domainclient.request(:get_info, :domain_name => domain).to_hash[:domain]['dnsEntries']
    end

    def self.set_entries(domain, entries)
      domainclient.request(:set_dns_entries, :domain_name => domain, :dns_entries => entries)
    end

  end
end