default[:moodle][:repository] = "https://github.com/moodle/moodle.git"
default[:moodle][:branch] = "MOODLE_26_STABLE"
default[:moodle][:https] = false

default[:moodle][:dbtype] = "mysqli"
default[:moodle][:dblibrary] = "native"
default[:moodle][:host] = "localhost"
default[:moodle][:prefix] = "mdl_"
default[:moodle][:dbpersist] = false
default[:moodle][:dbsocket] = false
default[:moodle][:dbport] = ""
default[:moodle][:directorypermission] = 02777
default[:moodle][:admin] = 'admin'

default[:moodle][:project][:log_level] = 'warn'
default[:moodle][:project][:application_env] = 'development'
default[:moodle][:project][:rewrite_log_level] = 0
default[:moodle][:project][:docroot] = '/var/www/public'
default[:moodle][:project][:dataroot] = '/var/www/mdl_data'
default[:moodle][:project][:log_dir] = '/var/log/apache2/'
default[:moodle][:project][:fullname] = "moodle test installation"
default[:moodle][:project][:shortname] = "mdl"
default[:moodle][:project][:admin_user] = "root"
default[:moodle][:project][:admin_pass] = "root"

