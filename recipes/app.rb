project = node[:moodle][:project]
app_name = project[:url_prefix] + project[:project_name]

web_app project[:project_name] do
    docroot "/var/www/public"
    template "site.conf.erb"
    server_name app_name
    server_aliases [app_name]
    log_dir "/var/www/data/log"
    application_env project[:application_env]
    log_level project[:log_level]
    rewrite_log_level project[:rewrite_log_level]
end

apache_site "default" do
    enable false
end