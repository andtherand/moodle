name		  	  "moodle"
maintainer        "mychiara"
maintainer_email  "mychiara+cookbooks@gmail.com"
license           "Apache 2.0"
description       "installs and configures moodle based on git"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.12"
recipe            "moodle", "installs elearning environment moodle"

%w{ debian ubuntu }.each do |os|
  supports os
end

%w{ apache2 php git database}.each do | cookbook |
	depends cookbook
end

