build:
	container build --arch arm64 -t debian-with-systemd .

run:
	container machine create debian-with-systemd --name work

logs:
	container machine logs work

exec:
	container machine run --name work

rm:
	container machine stop work; container machine rm work
