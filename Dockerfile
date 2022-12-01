FROM ubuntu:22.04 AS builder1

# Install dependencies
RUN apt update && apt upgrade -y
ARG JAVA_VERSION

# install java jre 8
RUN apt install -y git wget openjdk-${JAVA_VERSION}-jre screen

FROM builder1 AS builder2

ARG SERVER_VERSION

WORKDIR /srv

RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# download minecraft server
RUN java -jar BuildTools.jar --rev ${SERVER_VERSION}

FROM builder1

ARG SERVER_VERSION

WORKDIR /srv

RUN mkdir ./logs
RUN mkdir ./server

# copy server file from builder2
COPY --from=builder2 /srv/spigot-${SERVER_VERSION}.jar ./spigot.jar

COPY ./src .

# start minecraft server and print logs
CMD ./entrypoint.sh