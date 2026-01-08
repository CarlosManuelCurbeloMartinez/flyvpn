FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server stunnel4

RUN useradd -m vpn && echo "vpn:vpn123" | chpasswd

COPY stunnel.conf /etc/stunnel/stunnel.conf
COPY stunnel.pem /etc/stunnel/stunnel.pem

RUN chmod 600 /etc/stunnel/stunnel.pem

CMD service ssh start && sleep 2 && stunnel -f /etc/stunnel/stunnel.conf && tail -f /dev/null 
