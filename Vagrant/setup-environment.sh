#https://computingforgeeks.com/how-to-enable-and-use-ssh-x11-forwarding-on-vagrant-instances/
#https://www.digitalocean.com/community/tutorials/install-tomcat-9-ubuntu-1804-pt

rm -rf /vagrant/shared/Vagrant/logs
mkdir /vagrant/shared/Vagrant/logs

echo -e "\e[1;33mUpdating\e[0m"
sudo apt -qy update >> /vagrant/shared/Vagrant/logs/update.log 2>> /vagrant/shared/Vagrant/logs/update-error.log

echo -e "\e[1;33mUpgrading\e[0m"
sudo apt -qy upgrade >> /vagrant/shared/Vagrant/logs/upgrade.log 2>> /vagrant/shared/Vagrant/logs/upgrade-error.log

echo -e "\e[1;33mDistro Upgrading\e[0m"
sudo apt -qy dist-upgrade >> /vagrant/shared/Vagrant/logs/dist-upgrade.log 2>> /vagrant/shared/Vagrant/logs/dist-upgrade-error.log

echo -e "\e[1;33mAutoremoving\e[0m"
sudo apt -qy autoremove >> /vagrant/shared/Vagrant/logs/autoremove.log 2>> /vagrant/shared/Vagrant/logs/autoremove-error.log

echo -e "\e[1;33mCleaning\e[0m"
sudo apt -qy clean >> /vagrant/shared/Vagrant/logs/clean.log 2>> /vagrant/shared/Vagrant/logs/clean-error.log

echo -e "\e[1;33mInstalling x11-apps\e[0m"
sudo apt -qy install x11-apps >> /vagrant/shared/Vagrant/logs/x11-apps.log 2>> /vagrant/shared/Vagrant/logs/x11-apps-error.log

echo -e "\e[1;33mConfiguring the Sub-enviroment\e[0m"
source /vagrant/shared/Vagrant/java-environment.sh

echo -e "\e[1;33mSetup Finished\e[0m"