default[:moodle][:repository] = "git://git.moodle.org/moodle.git"
default[:moodle][:branch] = "master"
default[:moodle][:https] = false

default[:moodle][:host] = "localhost"

# db stuff
default[:moodle][:prefix] = "mdl_"

default[:moodle][:dbtype] = "mysqli"
default[:moodle][:dbpersist] = false
default[:moodle][:dblibrary] = "native"
default[:moodle][:dbsocket] = false
default[:moodle][:dbport] = ""
default[:moodle][:dbuser] = 'mdl_db_user'
default[:moodle][:dbpass] = 'I_really_should_be_changed,man!'
default[:moodle][:dbname] = 'moodle'
default[:moodle][:passwordsaltmain] = 'Er-zxpsd<$lwl1&el-$*C~`Sv<NE4z:h9sL&pJ!0+7HfZtSbp(mCdKBk:vb|309.'

default[:moodle][:directorypermissions] = 02777
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

