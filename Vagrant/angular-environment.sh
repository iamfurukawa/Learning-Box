echo -e "\e[1;33mStarting the Angular Environment Installation\e[0m"

echo -e "\e[1;33mInstalling VSCode\e[0m"
sudo snap install --classic code >> /vagrant/shared/Vagrant/logs/vscode.log 2>> /vagrant/shared/Vagrant/logs/vscode-error.log

echo -e "\e[1;33mInstalling NVM\e[0m"
curl -O https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh >> /vagrant/shared/Vagrant/logs/nvm.log 2>> /vagrant/shared/Vagrant/logs/nvm-error.log
source install.sh >> /vagrant/shared/Vagrant/logs/nvm.log 2>> /vagrant/shared/Vagrant/logs/nvm-error.log
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

echo -e "\e[1;33mInstalling Node\e[0m"
nvm install stable >> /vagrant/shared/Vagrant/logs/node.log 2>> /vagrant/shared/Vagrant/logs/node-error.log

echo -e "\e[1;33mInstalling Angular CLI\e[0m"
npm install -g @angular/cli >> /vagrant/shared/Vagrant/logs/angular-cli.log 2>> /vagrant/shared/Vagrant/logs/angular-cli-error.log

echo -e "\e[1;33mFinalizing the installation of the Angular Environment\e[0m"