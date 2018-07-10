#!/usr/bin/ruby
require 'json'

file = open("admin_list.json")
json = file.read
file.close
admins = JSON.parse(json)
for admin in admins
    puts admin['name'] 
    puts admin['key']     
    auth_file = File.open("/home/"+admin['name']+"/.ssh/authorized_keys",'a')
    auth_file.write(admin['key'])    
    auth_file.close
end    

