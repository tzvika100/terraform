#! /bin/bash
sudo -i
sudo apt update
sudo apt upgrade -y
sudo wget https://packages.chef.io/files/stable/chef-workstation/23.5.1040/ubuntu/22.04/chef-workstation_23.5.1040-1_amd64.deb
sudo dpkg -i chef-workstation_23.5.1040-1_amd64.deb
cd home/ubuntu
git clone https://github.com/tzvika100/chef.git
sudo chef-solo -c /home/ubuntu/chef/solo.rb -j /home/ubuntu/chef/runlist.json --chef-license=accept > /home/ubuntu/chefrunlog
