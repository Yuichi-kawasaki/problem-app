server '13.113.47.26', user: 'app', roles: %w{app db web}
set :ssh_options, {
  keys: '/Users/yuichikawasaki/.ssh/id_rsa',
  forward_agent: false,
  auth_methods: %w(publickey)
}
