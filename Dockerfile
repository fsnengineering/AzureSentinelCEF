FROM python:3.8.0-buster

ENV WORKSPACE_ID=0
ENV PRIMARY_KEY=0

WORKDIR /usr/src/app

#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get install -y \
  apt-utils
  
RUN apt-get install -y \
  wget \
  sudo \
  nano \
  && wget https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/CEF/cef_installer.py
#&& python cef_installer.py ${WORKSPACE_ID} ${PRIMARY_KEY}
  

VOLUME [ "/etc/rsyslog.d/" ]
VOLUME [ "/etc/syslog-ng/" ]

EXPOSE 25226 514
