# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'WebPolicy'

# Where to find external cookbooks:
default_source :supermarket, 'https://supermarket.chef.io'

# run_list: chef-client will run these recipes in the order specified.
run_list %w(
    app_inf::webserver,
    myServer::database
)

# Specify a custom source for a single cookbook:
cookbook 'app_inf', '~> 0.5.0', :supermarket
