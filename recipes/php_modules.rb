include_recipe "apache2"

modules = [
	"php5-xmlrpc", "php5-intl"
]

modules.each do | php_module |
	package php_module do 
		action :install
		notifies :reload, resources(:service => "apache2"), :delayed
	end
end