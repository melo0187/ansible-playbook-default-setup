test:
	vagrant up --provision

test-from-scratch:
	vagrant destroy && vagrant up

play:
	ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yml
