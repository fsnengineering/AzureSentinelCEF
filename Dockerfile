FROM python:3.5.8-slim-buster

ENV WORKSPACE_ID=0
ENV PRIMARY_KEY=0

RUN wget https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/CEF/cef_installer.py \
  && python cef_installer.py ${WORKSPACE_ID} ${PRIMARY_KEY}

VOLUME [ "/etc/rsyslog.d/" ]
VOLUME [ "/etc/syslog-ng/" ]

EXPOSE 25226 514
