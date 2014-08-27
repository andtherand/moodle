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
    :dbtype               => moodle[:dbtype],
    :dblibrary            => moodle[:dblibrary],
    :host                 => moodle[:host],
    :dbname               => moodle[:dbname],
    :dbuser               => moodle[:dbuser],
    :dbpass               => moodle[:dbpass],
    :prefix               => moodle[:prefix],
    :dbpersist            => moodle[:dbpersist],
    :dbsocket             => moodle[:dbsocket],
    :dbport               => moodle[:dbport],
    :wwwroot              => wwwroot,
    :dataroot             => project[:dataroot],
    :directorypermissions => moodle[:directorypermissions],
    :admin                => moodle[:admin],
    :passwordsaltmain     => moodle[:passwordsaltmain]
  )
end