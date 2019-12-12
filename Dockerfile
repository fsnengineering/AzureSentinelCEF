FROM ubuntu:16.04

ENV WORKSPACE_ID=0
ENV PRIMARY_KEY=0

ENV tmpdir /opt
RUN /usr/bin/apt-get update && /usr/bin/apt-get install -y libc-bin wget openssl curl sudo python-ctypes sysv-rc net-tools rsyslog cron vim dmidecode apt-transport-https && rm -rf /var/lib/apt/lists/*
COPY setup.sh main.sh startup.sh $tmpdir/
WORKDIR ${tmpdir}
RUN chmod 775 $tmpdir/*.sh; sync; $tmpdir/setup.sh
#CMD [ "/opt/main.sh" ]
#VOLUME [ "/etc/opt/microsoft/" ]

EXPOSE 25226 514

CMD [ "$tmpdir/startup.sh ${WORKSPACE_ID} ${PRIMARY_KEY}" ]
