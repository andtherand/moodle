git node[:moodle][:project][:docroot] do 
	repository node[:moodle][:repository]
	revision node[:moodle][:branch]
	action :checkout
end