FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=nointeractive

WORKDIR /minecraft-server

RUN apt-get update && apt-get install -y openjdk-17-jdk wget && rm -rf /var/lib/apt/lists/*

RUN cp minecraft_server_1.20.6.jar /minecraft-server

RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "java" ]

CMD [ "-Xmx1024M", "-Xms1024M", "-jar", "minecraft_server_1.20.6.jar", "nogui" ]