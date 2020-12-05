build:
	docker build -t emilrakhimov/practhw \ git@github.com:RakhimovEmil/my_practical_hw.git

start: build
	docker run --detach -p 8080:8080 --rm --volume 'pwd':/var/log emilrakhimov/practhw:latest

stop:
	docker stop emilrakhimov/practhw:latest

clean:
	docker rmi -f emilrakhimov/practhw:latest
	docker rm emilrakhimov/practhw:latest

healthcheck:
	@which -s docker || echo "you need to install docker"
