include_recipe 'database::mysql'

db = node[:moodle][:db]

service "mysql" do
  action :start
end

mysql_connection_info = {
    :host => node[:moodle][:host],
    :username => 'root',
    :password => node[:mysql][:server_root_password]
}

# create the database
mysql_database db[:dbname] do
    connection mysql_connection_info
    action :create
end

# create the user and grant rights
mysql_database_user db[:dbuser] do
    connection mysql_connection_info
    password db[:dbpass]
    privileges db[:privileges]
    action [:create, :grant]
end
