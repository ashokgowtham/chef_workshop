directory '/tmp/new_dir' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    recursive true
end

file '/tmp/hello' do
    content 'hello world'
end
