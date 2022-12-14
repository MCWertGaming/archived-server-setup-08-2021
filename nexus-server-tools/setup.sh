# install docker
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
# install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# enable and start docker
systemctl start docker
systemctl enable docker

# install docker-compose service and enable it
cp docker-compose.service /usr/lib/systemd/system/
systemctl enable docker-compose
systemctl start docker-compose
