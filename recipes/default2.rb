include_recipe "git"

include_recipe "php::module_soap"
include_recipe "php::module_dom"
include_recipe "php::module_mbstring"
include_recipe "php::module_xmlrpc"
include_recipe "php-intl"

execute "create db #{node[:moodle][:dbname]}" do
  command "/usr/bin/mysql -u root -proot -e 'CREATE DATABASE IF NOT EXISTS `#{node[:moodle][:dbname]}` DEFAULT CHARACTER SET utf8 " +
    "DEFAULT COLLATE utf8_general_ci;'"
  action :run
  ignore_failure true
end

execute "add db user" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
    "CREATE USER '#{node[:moodle][:dbuser]}'@'localhost' IDENTIFIED BY '#{node[:moodle][:dbpass]}'; " +
    "GRANT #{node[:moodle][:dbprivileges].join(', ')} ON #{node[:moodle][:dbname]}.* TO '#{node[:moodle][:dbuser]}'@'localhost';\""
  action :run
  ignore_failure true
end

node[:website][:docroot]     = node[:moodle][:docroot]
node[:website][:server_name] = node[:moodle][:wwwroot]
node[:website][:aliases]     = [node[:moodle][:wwwroot]]
node[:website][:log_dir]     = node[:moodle][:log_dir]

wwwroot = 'http://' + node[:moodle][:wwwroot]

if node[:moodle][:https] == true
    wwwroot = 'https://' + node[:moodle][:wwwroot]
end

template "#{node[:moodle][:docroot]}/config.php" do
  owner "root"
  group "root"
  source "config.php.erb"
  mode "0644"
  variables(
    :dbtype               => node[:moodle][:dbtype],
    :dblibrary            => node[:moodle][:dblibrary],
    :host                 => node[:moodle][:host],
    :dbname               => node[:moodle][:dbname],
    :dbuser               => node[:moodle][:dbuser],
    :dbpass               => node[:moodle][:dbpass],
    :prefix               => node[:moodle][:prefix],
    :dbpersist            => node[:moodle][:dbpersist],
    :dbsocket             => node[:moodle][:dbsocket],
    :dbport               => node[:moodle][:dbport],
    :wwwroot              => wwwroot,
    :dataroot             => node[:moodle][:dataroot],
    :directorypermissions => node[:moodle][:directorypermissions],
    :admin                => node[:moodle][:admin],
    :passwordsaltmain     => node[:moodle][:passwordsaltmain]
  )
end


execute "install moodle db via cli" do
  command "/usr/bin/php " +
    "#{node[:moodle][:docroot]}/admin/cli/install_database.php " +
    " --agree-license " +
    " --adminuser=#{node[:moodle][:admin_user]} " +
    " --adminpass=#{node[:moodle][:admin_pass]} " +
    " --fullname=#{node[:moodle][:fullname]} " +
    " --shortname=#{node[:moodle][:shortname]} "
  action :run
  ignore_failure true
end