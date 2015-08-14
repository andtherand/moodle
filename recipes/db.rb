db = node[:moodle]

mysql_connection_info = {
    :host => node[:moodle][:host],
    :username => 'root',
    :password => node[:mysql][:server_root_password],
    :socket => '/var/run/mysql-default/mysqld.sock'
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
