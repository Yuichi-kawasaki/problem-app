server '54.95.163.134', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yuichikawasaki/.ssh/id_rsa'
# set :stage, :production
# set :branch, ENV['BRANCH'] || 'master'
# set :ssh_options, {
#   user: 'hogehoge',
#   keys: %w(~/.ssh/id_rsa)
# }
# set :rails_env, :production
#
# # cap-ec2
# ec2_role :app, ssh_options: fetch(:ssh_options)
