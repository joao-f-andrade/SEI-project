#!/bin/bash
echo "Starting..."

sudo yum install -y docker

sudo service docker start


sudo docker login -u "joaofandrade" -p "R45dDhY0aE^9SKM*"
sudo docker pull joaofandrade/customer:1.0.0-SNAPSHOT
sudo docker run -d --name customer -p 8080:8080 joaofandrade/customer:1.0.0-SNAPSHOT
