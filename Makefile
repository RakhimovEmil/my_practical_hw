build:
	sudo docker build -t emilrakhimov/practhw \ git@github.com:RakhimovEmil/my_practical_hw.git

start:
	sudo docker run -it -p 8080:8080 emilrakhimov/practhw:latest

stop:
	sudo docker stop emilrakhimov/practhw:latest

clean:
	sudo docker rmi -f emilrakhimov/practhw:latest 

healthcheck:
	@which -s docker
