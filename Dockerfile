FROM fedora:31

ENV WORKSPACE_ID=0
ENV PRIMARY_KEY=0

WORKDIR /usr/src/app

RUN dnf -y update \

VOLUME [ "/etc/rsyslog.d/" ]
VOLUME [ "/etc/syslog-ng/" ]

VOLUME [ "/usr/src/app/" ]
VOLUME [ "/etc/opt/omi/" ]
VOLUME [ "/etc/opt/microsoft/" ]

EXPOSE 25226 514

COPY startup.sh .
ENTRYPOINT ["/bin/bash", "-c", "sudo sh /usr/src/app/startup.sh ${WORKSPACE_ID} ${PRIMARY_KEY}"]
