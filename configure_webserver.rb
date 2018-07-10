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
system("cd /var/www/html/")
status = system("git clone"+projectRepository+"")   
   
web_root = system("grep /var/www/html")   

