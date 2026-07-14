build:
	container build --arch arm64 -t debian-bookworm .

run:
	container run --rm -it --volume "$$HOME/work:/home/aaa/work" debian-bookworm


