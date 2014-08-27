Description
===========

Installs and configures the eLearning environment moodle

Requirements & Dependencies
===========================

Chef 0.10.10+.

Cookbooks:

* apache2 
* php 
* git 
* database

Platform
--------

* Debian, Ubuntu


Attributes
==========
Where is the base moodle repository?
And which version do you want to checkout?

```ruby
default[:moodle][:repository] = "https://github.com/moodle/moodle.git"
default[:moodle][:branch] = "MOODLE_26_STABLE"
default[:moodle][:https] = false
```

Database settings:
```ruby
default[:moodle][:dbtype] = "mysqli"
default[:moodle][:dblibrary] = "native"
default[:moodle][:host] = "localhost"
default[:moodle][:prefix] = "mdl_"
default[:moodle][:dbpersist] = false
default[:moodle][:dbsocket] = false
default[:moodle][:dbport] = ""
default[:moodle][:directorypermission] = 02777
default[:moodle][:admin] = 'admin'
```

Webserver settings:
```ruby
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
```

Usage
=====

License and Author
==================

- Author:: Andy Ruck (<mychiara+cookbooks@gmail.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
