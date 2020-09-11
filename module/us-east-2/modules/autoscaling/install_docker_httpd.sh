#! /bin/bash
sudo apt-get update
sudo apt-get install -y redis-tools
sudo apt-get install -y docker.io
sudo docker pull httpd
sudo mkdir /opt/app
echo "<h1>Deployed via Terraform..Private Instance</h1>" | sudo tee -a /opt/app/index.html
echo `hostname` | sed 's/^/<h1>/' | sed 's/$/<h1>/' | sudo tee -a /opt/app/index.html
sudo docker run -it --name apache -p 80:80 -v /opt/app:/usr/local/apache2/htdocs -d httpd
