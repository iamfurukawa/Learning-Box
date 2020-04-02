echo -e "\e[1;33mStarting the Java Environment Installation\e[0m"

echo -e "\e[1;33mInstalling JRE\e[0m"
sudo apt -qy install openjdk-11-jre-headless >> /vagrant/shared/Vagrant/logs/openjdk-11-jre-headless.log 2>> /vagrant/shared/Vagrant/logs/openjdk-11-jre-headless-error.log

echo -e "\e[1;33mInstalling JDK\e[0m"
sudo apt -qy install openjdk-11-jdk-headless >> /vagrant/shared/Vagrant/logs/openjdk-11-jdk-headless.log 2>> /vagrant/shared/Vagrant/logs/openjdk-11-jdk-headless-error.log

echo -e "\e[1;33mInstalling Default Java\e[0m"
sudo apt -qy install default-jre >> /vagrant/shared/Vagrant/logs/default-jre.log 2>> /vagrant/shared/Vagrant/logs/default-jre-error.log

echo -e "\e[1;33mDefining JAVA_HOME\e[0m"
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> /home/vagrant/.bashrc

echo -e "\e[1;33mDefining alias for start tomcat\e[0m"
echo "alias startTomcat='sudo systemctl start tomcat'" >> /home/vagrant/.bashrc

echo -e "\e[1;33mDefining alias for stop tomcat\e[0m"
echo "alias stopTomcat='sudo systemctl stop tomcat'" >> /home/vagrant/.bashrc

echo -e "\e[1;33mInstalling Maven\e[0m"
sudo apt -qy install maven >> /vagrant/shared/Vagrant/logs/maven.log 2>> /vagrant/shared/Vagrant/logs/maven-error.log

#echo -e "\e[1;33mInstalling Intellij\e[0m"
#sudo snap install intellij-idea-community --classic >> /vagrant/shared/Vagrant/logs/intellij-idea-community.log 2>> /vagrant/shared/Vagrant/logs/intellij-idea-community-error.log

echo -e "\e[1;33mInstalling Eclipse\e[0m"
cd /tmp
wget http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/2020-03/R/eclipse-jee-2020-03-R-incubation-linux-gtk-x86_64.tar.gz >> /vagrant/shared/Vagrant/logs/curl-eclipse.log 2>> /vagrant/shared/Vagrant/logs/curl-eclipse-error.log
sudo tar -zxvf eclipse-*.tar.gz -C /usr/ >> /vagrant/shared/Vagrant/logs/tar-eclipse.log 2>> /vagrant/shared/Vagrant/logs/tar-eclipse-error.log
sudo ln -s /usr/eclipse/eclipse /usr/bin/eclipse

echo -e "\e[1;33mInstalling libswt-gtk-4-jni\e[0m"
sudo apt -qy install libswt-gtk-4-jni >> /vagrant/shared/Vagrant/logs/libswt-gtk-4-jni.log 2>> /vagrant/shared/Vagrant/logs/libswt-gtk-4-jni-error.log

echo -e "\e[1;33mConfiguring Tomcat\e[0m"
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
cd /tmp
curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.33/bin/apache-tomcat-9.0.33.tar.gz >> /vagrant/shared/Vagrant/logs/curl-tomcat.log 2>> /vagrant/shared/Vagrant/logs/curl-tomcat-error.log
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1 >> /vagrant/shared/Vagrant/logs/tar-tomcat.log 2>> /vagrant/shared/Vagrant/logs/tar-tomcat-error.log
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/
sudo mv /vagrant/shared/Vagrant/tomcat.service /etc/systemd/system/
sudo cp /etc/systemd/system/tomcat.service /vagrant/shared/Vagrant/tomcat.service
sudo systemctl daemon-reload
sudo ufw allow 8080 >> /vagrant/shared/Vagrant/logs/ufw-allow.log 2>> /vagrant/shared/Vagrant/logs/ufw-allow.log

echo -e "\e[1;33mFinalizing the installation of the Java Environment\e[0m"