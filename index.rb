require_relative 'configurable'
require_relative 'adapters/mysql'
require_relative 'adapters/pg'

class Database
  include Configurable.with(:host, :port, :login, :password, :adapter)
  attr_accessor :connect

  def self.get_connect()
  	@@connect ||= Kernel.const_get(self.config.adapter).connect(self.config)
  end
end

Database.configure do
  host "localhost"
  port "8080"
  login "vitalii"
  password "12345"
  adapter 'Mysql'
end

p Database.config
p Database.get_connect()