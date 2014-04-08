#
# The `config` provider
#

def whyrun_supported?
  true
end

use_inline_resources

action :create do
  place_config(new_resource, :create)
end

action :delete do
  place_config(new_resource, :delete)
end

#
# Places a config for the s3cmd
#
def place_config(resource, action)
  # make sure the directory exists by syslog user
  directory ::File.dirname(resource.filename) do
    owner resource.owner unless resource.owner.nil?
    recursive true
  end

  template resource.filename do
    source "s3cfg.erb"
    variables(
      :access_key =>  resource.access_key,
      :secret_key =>  resource.secret_key,
      :gpg_passphrase =>  resource.gpg_passphrase,
      :bucket_location =>  resource.bucket_location,
      :https =>  resource.https,
      :encrypt =>  resource.encrypt
    )
    owner resource.owner unless resource.owner.nil?
    mode 0600
  end

end
