
nomad_consul_config 'test' do
  address '127.0.0.1:8500'
  auto_advertise false
  client_auto_join false
  server_auto_join false
  verify_ssl false
end

nomad_vault_config 'test' do
  enabled false
end

# Nice lightweight daemon for testing
nomad_job 'cadvisor' do
  source 'cadvisor.hcl.erb'
  notifies :run, 'nomad_job[cadvisor]', :delayed
end

package 'curl'

ruby_block 'let-nomad-service-settle' do
  block do
    sleep 10
  end
end
