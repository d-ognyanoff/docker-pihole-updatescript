# Upgrade containerized pihole to the latest version



## I was getting tired of doing this by hand every time. So I wrote a simple script to upgrade my pihole on Docker.

Basically it stopps the pihole container, removes the container, then the pihole image. It downloads the new pihole:latest image and deploys pihole.

I use the host /etc/hosts to map my local devices so it is mounting the /etc/hosts to the container as a volume.
