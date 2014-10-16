moodle = node[:moodle]
project = moodle[:project]
app_name = project[:url_prefix] + project[:project_name]

wwwroot = 'http://' + app_name

if moodle[:https] == true
    wwwroot = 'https://' + + app_name
end

template "#{project[:docroot]}/config.php" do
  owner "root"
  group "root"
  source "config.php.erb"
  mode "0644"
  variables(
    :db_type               => moodle[:dbtype],
    :db_library            => moodle[:dblibrary],
    :host                 => moodle[:host],
    :db_name               => moodle[:dbname],
    :db_user               => moodle[:dbuser],
    :db_pass               => moodle[:dbpass],
    :prefix               => moodle[:prefix],
    :db_persist            => moodle[:dbpersist],
    :db_socket             => moodle[:dbsocket],
    :db_port               => moodle[:dbport],
    :wwwroot              => wwwroot,
    :dataroot             => project[:dataroot],
    :directorypermissions => moodle[:directorypermissions],
    :admin                => moodle[:admin],
    :passwordsaltmain     => moodle[:passwordsaltmain]
  )
end