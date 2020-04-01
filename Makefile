docker_build:
	sudo docker build -t micro-service-consignment .

docker_run:
	sudo docker run -p 50051:50051 -e MICRO_SERVER_ADDRESS=:50051 micro-service-consignment

proto_gen:
	protoc -I. --go_out=plugins=micro:. proto/consignment/consignment.proto
	protoc -I. --go_out=plugins=micro:. proto/vessel/vessel.proto

git_push:
	git add -u && git add . && git commit -m "Dev commit"; git push origin master