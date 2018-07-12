current_dir = File.dirname(__FILE__)
  log_level                :info
  log_location             STDOUT
  node_name                'ns058087'
  client_key               "#{current_dir}/nsteinbaugh.pem"
  validation_client_name   'ets-validator'
  validation_key           "#{current_dir}/ets-validator.pem"
  chef_server_url          'https://ec2-18-222-117-54.us-east-2.compute.amazonaws.com/organizations/ets'
  cookbook_path            ["#{current_dir}/../cookbooks"]


