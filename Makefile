build:
	container build --arch arm64 -t debian-with-systemd .

run:
	container machine create debian-with-systemd --name work

logs:
	container machine logs work

exec:
	container machine run --name work

stop:
	container machine stop work

rm:
	container machine stop work; container machine rm work

configure:
	container machine set -n work cpus=8 memory=11G
	sudo container system dns create machine
	container system dns list
	# then, you can resolve IP by `ping work.machine`