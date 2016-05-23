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
file '/var/www/html/static/index.html' do
    content '<html>
    <body>
        <h1>hello world</h1>
    </body>
</html>'
end

# add nginx conf entry to serve static pages from /var/www/html
file '/etc/nginx/conf.d/my_server.conf' do
    content '
server {
    listen 8080;
    location /static/ {
        root /var/www/html;
    }
}'
end

# restart nginx to reload the configuration
service 'nginx' do
    action :restart
end
