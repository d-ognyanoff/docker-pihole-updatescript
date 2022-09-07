#!/bin/bash

# Stop docker and remove pihole image

echo "Stopping pihole and removing old image..."
echo
docker stop pihole
echo "...stopped" 
echo
docker rm pihole
echo "...removed"
image_id="$(docker images | grep pihole | awk '{ print $3 }')"
docker rmi "$image_id"

#docker build with password=Prassword!

echo "Pulling new image and running..."
echo
docker run -d \
--name pihole \
--cap-add NET_ADMIN \
-p 53:53/tcp \
-p 53:53/udp \
-p 80:80 \
-e DNS1=127.0.0.1 \
-e DNS2=1.1.1.1 \
-v /etc/localtime:/etc/localtime \
-v /storage/.config/pihole/:/etc/pihole \
-v /storage/.config/pihole/dnsmasq.d/:/etc/dnsmasq.d \
-v /storage/.config/pihole/html/:/var/www/html/html/ \
-v /etc/hosts:/etc/hosts \
-h $(cat /etc/hostname) \
-e ServerIP=$(ip route get 127.0.0.1 | awk '{ print $NF; exit }') \
-e WEBPASSWORD=SecretPassword123! \
--restart=unless-stopped \
pihole/pihole:latest 

echo
echo "All done!..."
echo
