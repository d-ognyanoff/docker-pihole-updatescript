# docker-pihole-updatescript

# I was getting tired of doing this by hand every time. So I wrote a simple script to upgrade my pihole on Docker.

Basically it stopps the pihole container, removes the container, then the pihole image. It downloads the new image and deploys the pihole.
