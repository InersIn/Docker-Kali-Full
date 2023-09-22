# Docker-Kali-Full
Setup Kali Full in Docker

# Run
```bash
docker build . -t <tag name>
docker run -d --net=host -v /root/box:/root/box --name box box:latest
```

# Connect SSH
After docker build complete, now you need to login to the container using ssh
```bash
ssh root@0.0.0.0 -p <port ssh>
```
Port ssh is the port that you specified in Dockerfile, and the creds is "root:root".

# Install Kali Full
Install "kali-linux-headless".
```bash
apt-get install kali-linux-headless -y
```

# Last
You need to change the password of root by using below command.
```bash
passwd
```
# Disclaimer
Because the docker is using network host (--net=host) on run, you need to becarefull because if you open or listen port on your docker it will open the port on host network!.
