FROM python:3.8.0-slim-buster

ENV WORKSPACE_ID=0
ENV PRIMARY_KEY=0

WORKDIR /usr/src/app

RUN apt-get update && apt -y upgrade \
  && apt-get install -y \
  apt-utils \
  wget \
  sudo \
  nano \
  procps \
  cron \
  && apt install -y python3-pip \
  build-essential libssl-dev libffi-dev python3-dev

VOLUME [ "/etc/rsyslog.d/" ]
VOLUME [ "/etc/syslog-ng/" ]

VOLUME [ "/usr/src/app/" ]
VOLUME [ "/etc/opt/omi/" ]
VOLUME [ "/etc/opt/microsoft/" ]

EXPOSE 25226 514

COPY startup.sh .
ENTRYPOINT ["/bin/bash", "-c", "sudo sh /usr/src/app/startup.sh ${WORKSPACE_ID} ${PRIMARY_KEY}"]
