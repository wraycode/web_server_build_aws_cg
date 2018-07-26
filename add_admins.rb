#!/usr/bin/ruby
require 'json'

file = open("admin_list.json")
json = file.read
file.close
admins = JSON.parse(json)
for admin in admins
    wasGood = system("./add_admin.sh "+admin['name']+"")   
    if wasGood
	    auth_file = File.open("/home/"+admin['name']+"/.ssh/authorized_keys",'a')
	    auth_file.write(admin['key'])    
	    auth_file.close
	    system("sudo chown -R "+admin['name']+":"+admin['name']+" /home/"+admin['name']+"/.ssh/authorized_keys")   
	end    
end    

