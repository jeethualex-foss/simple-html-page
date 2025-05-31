user :=
#pass :=

default: login

login:
	docker login -u $(user) -p $(pass)

build:
	docker build -t $(tag) .
	docker push $(tag)

deploy:
	docker run --name $(app) -d -p 80:80 $(tag)

debug:
	docker exec -it $(app) sh

hello:
	@echo "Hello, World"

hello1:
	@echo "Hello 1, World"