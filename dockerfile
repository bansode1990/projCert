touch dockerfile
cat <<EOT>> dockerfile 
From tomcat
Add https://github.com/bansode1990/projCert.git /user/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
EOT
sudo docker build -t bansode1990/edureka:$BUILD_NUMBER .
sudo docker login -u $USERNAME -p $PASSWD
sudo docker push bansode1990/edureka:$BUILD_NUMBER
sudo docker run -itd -P bansode1990/edureka:$BUILD_NUMBER
