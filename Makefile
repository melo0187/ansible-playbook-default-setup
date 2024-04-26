test-install:
	@wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	@echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $$(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	@sudo apt update && sudo apt install -y vagrant virtualbox

test:
	vagrant up --provision

test-from-scratch:
	vagrant destroy && vagrant up

play:
	ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yml
