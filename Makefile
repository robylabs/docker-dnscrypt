NAME=dnscrypt
VERSION=sandbox

${VERSION}:
	docker build --force-rm -t robylabs/${NAME}:${VERSION} .

clean:
	-docker kill ${NAME}
	-docker rm ${NAME}
	-docker rmi -f robylabs/${NAME}:${VERSION}

run:
	docker run -d -p 2053:2053/tcp -p 2053:2053/udp --name ${NAME} robylabs/${NAME}:${VERSION}
