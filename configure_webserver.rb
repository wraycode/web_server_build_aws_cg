#!/usr/bin/ruby
require 'json'



def prompt(*args)
  print(*args)
  result = gets.strip
  return result.empty? ? 'error' : result
end   

#serverName = prompt "Enter serverName: "
#print serverName+"\n\r"
projectRepository = prompt "Enter Project Repository: "
print projectRepository+"\n\r"
system("rm /var/www/html/*")
Dir.chdir "/var/www/html/"
status = system("git clone "+projectRepository+"")   
   
web_root = system("ls /var/www/html")  
print web_root 

