# Docker-Kali-Full
Setup Kali Full in Docker

# Run
```bash
docker build . -t <tag name>
```

# Connect SSH
After docker build complete, now you need to login to the container using ssh
```bash
ssh root@0.0.0.0 -p <port ssh>
```
Port ssh is the port that you specified in Dockerfile, and the creds is "root:root".

# Install Kali Full
Because i just want using CLI without GUI, then i just install "kali-linux-headless". If you want to installed with GUI, install "kali-linux-large".
```bash
apt-get install kali-linux-headless -y
```

# Last
You need to change the password of root by using below command.
```bash
passwd
```
