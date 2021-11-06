import os

os.system("sudo rsync -avh --delete /etc/nginx_backup/ /etc/nginx/")
print ("OK! Nginx restored from backup!")
os.system("sudo systemctl is-active --quiet nginx || (echo '…' >> log.txt && systemctl restart nginx)")