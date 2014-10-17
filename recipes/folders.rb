project = node[:moodle][:project]

directory "#{project[:docroot]}" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  not_if do
     File.directory? "#{project[:docroot]}"
  end
end

directory "#{project[:dataroot]}" do
  owner "root"
  group "root"
  mode "01755"
  action :create
  not_if do
     File.directory? "#{project[:dataroot]}"
  end
end