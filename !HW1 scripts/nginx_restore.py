import os

os.system("sudo rsync -avh --delete /etc/nginx_backup/ /etc/nginx/")
print ("OK! Nginx restored from backup!")
