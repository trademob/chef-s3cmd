#
# The `config` resource
#

actions :create, :delete
default_action :create

attribute :filename, :kind_of => String, :name_attribute => true
attribute :owner, :kind_of => [String, NilClass], :default => nil
attribute :access_key, :kind_of => String
attribute :secret_key, :kind_of => String
attribute :bucket_location, :kind_of => String
attribute :gpg_passphrase, :kind_of => String, :default => ''
attribute :encrypt, :kind_of => [TrueClass, FalseClass], :default => false
attribute :https, :kind_of => [TrueClass, FalseClass], :default => false
