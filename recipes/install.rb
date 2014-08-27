project = node[:moodle][:project]
docroot = project[:docroot]

execute "install moodle db via cli" do
  command "/usr/bin/php " +
    "#{docroot}/admin/cli/install_database.php " +
    " --agree-license " +
    " --adminuser=#{project[:admin_user]} " +
    " --adminpass=#{project[:admin_pass]} " +
    " --fullname=#{project[:fullname]} " +
    " --shortname=#{project[:shortname]} "
  action :run
  ignore_failure true
end