This is my attempt to have a Ansible playbook of my usual dev setup.
It is based on what I learned so far by reading "Ansible for DevOps".

## Setup
### Install Ansbile
```shell
$ sudo apt-add-repository -y ppa:ansible/ansible
$ sudo apt-get update 
$ sudo apt-get install -y ansible
```
### Run the playbook
Should just be `ansible-playbook --connection=local --inventory 127.0.0.1, --ask-become-pass playbook.yml`

## Testing
To be able to test the playbook I use Vagrant and an Ubuntu box in VirtualBox.
### Install Vagrant
```shell
$ wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
$ sudo apt update && sudo apt install vagrant
```
### Install Virtualbox
Should be available from Ubuntu packages, just
`sudo apt install virtualbox`.

### Test the playbook on VM
The Vagrantfile has already been changed to use the playbook for provisioning.
Running `vagrant up` will run the playbook once the VM is up.
To rerun the playbook on the already running VM run `vagrant provision`.
To retest from scratch first run `vagrant destroy` followed by `vagrant up`.

