#!/usr/bin/ruby
require 'json'




def prompt(*args)
  print(*args)
  result = gets.strip
  return result.empty? ? 'error' : result
end

serverName = prompt "Enter serverName: "
#print serverName+"\n\r"
#projectRepository = prompt "Enter Project Repository: "
#print projectRepository+"\n\r"
#system("rm /var/www/html/*")
Dir.chdir "/var/www/html/"
#status = system("git clone "+projectRepository+"")   
#web_root = system("ls /var/www/html")  
web_root = %x[ls /var/www/html]
print web_root

#system('sudo sed -i "/DocumentRoot/c\        DocumentRoot /var/www/html/'+web_root+'" /etc/apache2/sites-available/000-default.conf')
#system('sudo sed -e "/DocumentRoot /var/www/html/'+web_root+'/a\" -e "ServerName '+serverName+'" /etc/apache2/sites-available/000-default.conf')
#system('sudo service apache2 restart')

#print 'setting up letsencrypt ssl certs'
#openedPorts =promt "Certbot needs to have access to the server. Have the ports been opened up for http and https? (y/n)"
#if openedPorts.downcase == 'y' then
#	system('sudo ./letsEncrypt')
#else
#	puts "Ports will need to be opened before Certbot can setup the ssl certificates"
#end	

Dir.chdir web_root
system('composer install')

#print "setting up apache basic authintication"
#system('sudo apt-get install apache2-utils')
