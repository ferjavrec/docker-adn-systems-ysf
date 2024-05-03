FROM debian:bullseye-slim

COPY entrypoint /entrypoint
COPY config /opt/

RUN useradd -u 54000 radio && \
        apt-get update && \
        apt-get install -y  git curl && \
        cd /opt && \
        git clone https://github.com/DVSwitch/MMDVM_Bridge.git  && \
        chmod 777 /opt/ -R 

USER radio

ENTRYPOINT [ "/entrypoint" ]
