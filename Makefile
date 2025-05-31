user :=
#pass :=

default: login

login:
	docker login -u $(user)

hello:
	@echo "Hello, World"

hello1:
	@echo "Hello 1, World"