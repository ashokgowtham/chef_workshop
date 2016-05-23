yum_package 'epel-release'
yum_package 'nginx'

service 'nginx' do
    action [:enable]
end

# ensure directory exists before creating files
directory '/var/www/html/static' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    recursive true
end

# create a static file to be served
template '/var/www/html/static/index.html' do
    source 'index.html.erb'
end

# add nginx conf entry to serve static pages from /var/www/html
template '/etc/nginx/conf.d/my_server.conf' do
    source 'my_server.conf.erb'
    variables port_number: 8080
end

# restart nginx to reload the configuration
service 'nginx' do
    action :restart
end
