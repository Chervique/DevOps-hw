#! /bin/bash
restartNginx () {

sudo rsync -avh --delete /etc/nginx_backup/ /etc/nginx/
echo "OK! Nginx restored from backup!"

sudo systemctl is-active --quiet nginx || (echo '…' >> log.txt && systemctl restart nginx)

}

restartNginx
#echo "Waiting 1m before next try"
#sleep 1m
#restartNginx
#echo "Waiting 1m before next try"
#sleep 1m
#restartNginx

